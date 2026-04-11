#include "types.h"
#include "stat.h"
#include "user.h"
#include "uthread.h"

#define MAX_THREADS 8
#define STACK_SIZE  4096

enum thread_state { UNUSED, RUNNABLE, RUNNING, ZOMBIE };

struct thread {
  void *stack;
  enum thread_state state;
  struct context *context;
  int tid;
};

struct thread thread_table[MAX_THREADS];
struct thread *current_thread;

void thread_stub(void (*fn)(void*), void *arg) {
  fn(arg);
  current_thread->state = ZOMBIE;
  thread_yield();
}

void thread_init(void) {
  int i;
  for (i = 0; i < MAX_THREADS; i++) {
    thread_table[i].state = UNUSED;
  }
  current_thread = &thread_table[0];
  current_thread->state = RUNNING;
  current_thread->tid = 0;
}

tid_t thread_create(void (*fn)(void*), void *arg) {
  struct thread *t = 0;
  int i;

  for (i = 0; i < MAX_THREADS; i++) {
    if (thread_table[i].state == UNUSED) {
      t = &thread_table[i];
      break;
    }
  }

  if (!t) return -1;

  t->stack = malloc(STACK_SIZE);
  char *sp = (char*)t->stack + STACK_SIZE;

  sp -= 4; *(uint*)sp = (uint)arg;
  sp -= 4; *(uint*)sp = (uint)fn;
  sp -= 4; *(uint*)sp = 0;

  sp -= sizeof(struct context);
  t->context = (struct context*)sp;
  t->context->eip = (uint)thread_stub;
  t->state = RUNNABLE;
  t->tid = (int)(t - thread_table);

  return t->tid;
}

void thread_yield(void) {
  struct thread *prev = current_thread;
  struct thread *next = 0;
  int i, idx;
  int start = (prev->tid + 1) % MAX_THREADS;

  for (i = 0; i < MAX_THREADS; i++) {
    idx = (start + i) % MAX_THREADS;
    if (thread_table[idx].state == RUNNABLE) {
      next = &thread_table[idx];
      break;
    }
  }

  if (next && next != prev) {
    if (prev->state == RUNNING) prev->state = RUNNABLE;
    next->state = RUNNING;
    current_thread = next;
    uswtch(&prev->context, next->context);
  }
}

int thread_join(tid_t tid) {
  if (tid < 0 || tid >= MAX_THREADS) return -1;

  while (thread_table[tid].state != ZOMBIE && thread_table[tid].state != UNUSED) {
    thread_yield();
  }

  if (thread_table[tid].state == ZOMBIE) {
    free(thread_table[tid].stack);
    thread_table[tid].state = UNUSED;
  }

  return 0;
}