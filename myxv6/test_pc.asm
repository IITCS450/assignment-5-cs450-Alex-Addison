
_test_pc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
      thread_yield();
    }
  }
}

int main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  tid_t p1, p2, c1;

  thread_init();
  14:	e8 d7 08 00 00       	call   8f0 <thread_init>
  mutex_init(&mu);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	68 c0 10 00 00       	push   $0x10c0
  21:	e8 4a 0b 00 00       	call   b70 <mutex_init>

  p1 = thread_create(producer, (void*)1);
  26:	59                   	pop    %ecx
  27:	5b                   	pop    %ebx
  28:	6a 01                	push   $0x1
  2a:	68 70 01 00 00       	push   $0x170
  2f:	e8 2c 09 00 00       	call   960 <thread_create>
  p2 = thread_create(producer, (void*)2);
  34:	5e                   	pop    %esi
  p1 = thread_create(producer, (void*)1);
  35:	89 c7                	mov    %eax,%edi
  p2 = thread_create(producer, (void*)2);
  37:	58                   	pop    %eax
  38:	6a 02                	push   $0x2
  3a:	68 70 01 00 00       	push   $0x170
  3f:	e8 1c 09 00 00       	call   960 <thread_create>
  44:	89 c6                	mov    %eax,%esi
  c1 = thread_create(consumer, 0);
  46:	58                   	pop    %eax
  47:	5a                   	pop    %edx
  48:	6a 00                	push   $0x0
  4a:	68 b0 00 00 00       	push   $0xb0
  4f:	e8 0c 09 00 00       	call   960 <thread_create>

  if(p1 < 0 || p2 < 0 || c1 < 0){
  54:	83 c4 10             	add    $0x10,%esp
  c1 = thread_create(consumer, 0);
  57:	89 c3                	mov    %eax,%ebx
  if(p1 < 0 || p2 < 0 || c1 < 0){
  59:	89 f8                	mov    %edi,%eax
  5b:	09 f0                	or     %esi,%eax
  5d:	09 d8                	or     %ebx,%eax
  5f:	79 14                	jns    75 <main+0x75>
    printf(1, "thread_create failed\n");
  61:	83 ec 08             	sub    $0x8,%esp
  64:	68 ef 0b 00 00       	push   $0xbef
  69:	6a 01                	push   $0x1
  6b:	e8 50 05 00 00       	call   5c0 <printf>
    exit();
  70:	e8 ee 03 00 00       	call   463 <exit>
  }

  thread_join(p1);
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	57                   	push   %edi
  79:	e8 62 0a 00 00       	call   ae0 <thread_join>
  thread_join(p2);
  7e:	89 34 24             	mov    %esi,(%esp)
  81:	e8 5a 0a 00 00       	call   ae0 <thread_join>
  thread_join(c1);
  86:	89 1c 24             	mov    %ebx,(%esp)
  89:	e8 52 0a 00 00       	call   ae0 <thread_join>

  printf(1, "test_pc: done\n");
  8e:	58                   	pop    %eax
  8f:	5a                   	pop    %edx
  90:	68 05 0c 00 00       	push   $0xc05
  95:	6a 01                	push   $0x1
  97:	e8 24 05 00 00       	call   5c0 <printf>
  exit();
  9c:	e8 c2 03 00 00       	call   463 <exit>
  a1:	66 90                	xchg   %ax,%ax
  a3:	66 90                	xchg   %ax,%ax
  a5:	66 90                	xchg   %ax,%ax
  a7:	66 90                	xchg   %ax,%ax
  a9:	66 90                	xchg   %ax,%ax
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <consumer>:
static void consumer(void *arg){
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  int got = 0;
  b5:	31 db                	xor    %ebx,%ebx
  b7:	eb 1c                	jmp    d5 <consumer+0x25>
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      mutex_unlock(&mu);
  c0:	83 ec 0c             	sub    $0xc,%esp
  c3:	68 c0 10 00 00       	push   $0x10c0
  c8:	e8 e3 0a 00 00       	call   bb0 <mutex_unlock>
      thread_yield();
  cd:	e8 2e 09 00 00       	call   a00 <thread_yield>
      mutex_lock(&mu);
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	83 ec 0c             	sub    $0xc,%esp
  d8:	68 c0 10 00 00       	push   $0x10c0
  dd:	e8 9e 0a 00 00       	call   b80 <mutex_lock>
      if(count > 0){
  e2:	a1 c4 10 00 00       	mov    0x10c4,%eax
  e7:	83 c4 10             	add    $0x10,%esp
  ea:	85 c0                	test   %eax,%eax
  ec:	7e d2                	jle    c0 <consumer+0x10>
        int x = buf[head];
  ee:	8b 15 cc 10 00 00    	mov    0x10cc,%edx
        mutex_unlock(&mu);
  f4:	83 ec 0c             	sub    $0xc,%esp
        count--;
  f7:	83 e8 01             	sub    $0x1,%eax
        got++;
  fa:	83 c3 01             	add    $0x1,%ebx
        mutex_unlock(&mu);
  fd:	68 c0 10 00 00       	push   $0x10c0
        int x = buf[head];
 102:	8b 34 95 e0 10 00 00 	mov    0x10e0(,%edx,4),%esi
        head = (head+1)%N;
 109:	83 c2 01             	add    $0x1,%edx
        count--;
 10c:	a3 c4 10 00 00       	mov    %eax,0x10c4
        head = (head+1)%N;
 111:	89 d1                	mov    %edx,%ecx
 113:	c1 f9 1f             	sar    $0x1f,%ecx
 116:	c1 e9 1d             	shr    $0x1d,%ecx
 119:	01 ca                	add    %ecx,%edx
 11b:	83 e2 07             	and    $0x7,%edx
 11e:	29 ca                	sub    %ecx,%edx
 120:	89 15 cc 10 00 00    	mov    %edx,0x10cc
        mutex_unlock(&mu);
 126:	e8 85 0a 00 00       	call   bb0 <mutex_unlock>
        got++;
 12b:	69 c3 29 5c 8f c2    	imul   $0xc28f5c29,%ebx,%eax
 131:	83 c4 10             	add    $0x10,%esp
 134:	c1 c8 02             	ror    $0x2,%eax
        if(got % 100 == 0) printf(1, "consumer got %d (last=%d)\n", got, x);
 137:	3d 28 5c 8f 02       	cmp    $0x28f5c28,%eax
 13c:	76 12                	jbe    150 <consumer+0xa0>
  while(got < 400){
 13e:	81 fb 90 01 00 00    	cmp    $0x190,%ebx
 144:	75 8f                	jne    d5 <consumer+0x25>
}
 146:	8d 65 f8             	lea    -0x8(%ebp),%esp
 149:	5b                   	pop    %ebx
 14a:	5e                   	pop    %esi
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi
        if(got % 100 == 0) printf(1, "consumer got %d (last=%d)\n", got, x);
 150:	56                   	push   %esi
 151:	53                   	push   %ebx
 152:	68 d4 0b 00 00       	push   $0xbd4
 157:	6a 01                	push   $0x1
 159:	e8 62 04 00 00       	call   5c0 <printf>
 15e:	83 c4 10             	add    $0x10,%esp
 161:	eb db                	jmp    13e <consumer+0x8e>
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <producer>:
static void producer(void *arg){
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
        buf[tail] = id*100000 + i;
 175:	69 5d 08 a0 86 01 00 	imul   $0x186a0,0x8(%ebp),%ebx
 17c:	8d b3 c8 00 00 00    	lea    0xc8(%ebx),%esi
 182:	eb 19                	jmp    19d <producer+0x2d>
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      mutex_unlock(&mu);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	68 c0 10 00 00       	push   $0x10c0
 190:	e8 1b 0a 00 00       	call   bb0 <mutex_unlock>
      thread_yield();
 195:	e8 66 08 00 00       	call   a00 <thread_yield>
      mutex_lock(&mu);
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	83 ec 0c             	sub    $0xc,%esp
 1a0:	68 c0 10 00 00       	push   $0x10c0
 1a5:	e8 d6 09 00 00       	call   b80 <mutex_lock>
      if(count < N){
 1aa:	a1 c4 10 00 00       	mov    0x10c4,%eax
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	83 f8 07             	cmp    $0x7,%eax
 1b5:	7f d1                	jg     188 <producer+0x18>
        buf[tail] = id*100000 + i;
 1b7:	8b 15 c8 10 00 00    	mov    0x10c8,%edx
        mutex_unlock(&mu);
 1bd:	83 ec 0c             	sub    $0xc,%esp
        count++;
 1c0:	83 c0 01             	add    $0x1,%eax
        mutex_unlock(&mu);
 1c3:	68 c0 10 00 00       	push   $0x10c0
        buf[tail] = id*100000 + i;
 1c8:	89 1c 95 e0 10 00 00 	mov    %ebx,0x10e0(,%edx,4)
        tail = (tail+1)%N;
 1cf:	83 c2 01             	add    $0x1,%edx
  for(i=0; i<200; i++){
 1d2:	83 c3 01             	add    $0x1,%ebx
        tail = (tail+1)%N;
 1d5:	89 d1                	mov    %edx,%ecx
        count++;
 1d7:	a3 c4 10 00 00       	mov    %eax,0x10c4
        tail = (tail+1)%N;
 1dc:	c1 f9 1f             	sar    $0x1f,%ecx
 1df:	c1 e9 1d             	shr    $0x1d,%ecx
 1e2:	01 ca                	add    %ecx,%edx
 1e4:	83 e2 07             	and    $0x7,%edx
 1e7:	29 ca                	sub    %ecx,%edx
 1e9:	89 15 c8 10 00 00    	mov    %edx,0x10c8
        mutex_unlock(&mu);
 1ef:	e8 bc 09 00 00       	call   bb0 <mutex_unlock>
  for(i=0; i<200; i++){
 1f4:	83 c4 10             	add    $0x10,%esp
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 a2                	jne    19d <producer+0x2d>
}
 1fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    
 202:	66 90                	xchg   %ax,%ax
 204:	66 90                	xchg   %ax,%ax
 206:	66 90                	xchg   %ax,%ax
 208:	66 90                	xchg   %ax,%ax
 20a:	66 90                	xchg   %ax,%ax
 20c:	66 90                	xchg   %ax,%ax
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 210:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 211:	31 c0                	xor    %eax,%eax
{
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	8b 4d 08             	mov    0x8(%ebp),%ecx
 219:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 220:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 224:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 227:	83 c0 01             	add    $0x1,%eax
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 22e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 231:	89 c8                	mov    %ecx,%eax
 233:	c9                   	leave  
 234:	c3                   	ret    
 235:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 24a:	0f b6 02             	movzbl (%edx),%eax
 24d:	84 c0                	test   %al,%al
 24f:	75 17                	jne    268 <strcmp+0x28>
 251:	eb 3a                	jmp    28d <strcmp+0x4d>
 253:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 257:	90                   	nop
 258:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 25c:	83 c2 01             	add    $0x1,%edx
 25f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 262:	84 c0                	test   %al,%al
 264:	74 1a                	je     280 <strcmp+0x40>
    p++, q++;
 266:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 268:	0f b6 19             	movzbl (%ecx),%ebx
 26b:	38 c3                	cmp    %al,%bl
 26d:	74 e9                	je     258 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 26f:	29 d8                	sub    %ebx,%eax
}
 271:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 274:	c9                   	leave  
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 280:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 284:	31 c0                	xor    %eax,%eax
 286:	29 d8                	sub    %ebx,%eax
}
 288:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28b:	c9                   	leave  
 28c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 28d:	0f b6 19             	movzbl (%ecx),%ebx
 290:	31 c0                	xor    %eax,%eax
 292:	eb db                	jmp    26f <strcmp+0x2f>
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <strlen>:

uint
strlen(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 3a 00             	cmpb   $0x0,(%edx)
 2a9:	74 15                	je     2c0 <strlen+0x20>
 2ab:	31 c0                	xor    %eax,%eax
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c0 01             	add    $0x1,%eax
 2b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2b7:	89 c1                	mov    %eax,%ecx
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	89 c8                	mov    %ecx,%eax
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    
 2bf:	90                   	nop
  for(n = 0; s[n]; n++)
 2c0:	31 c9                	xor    %ecx,%ecx
}
 2c2:	5d                   	pop    %ebp
 2c3:	89 c8                	mov    %ecx,%eax
 2c5:	c3                   	ret    
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2e5:	89 d0                	mov    %edx,%eax
 2e7:	c9                   	leave  
 2e8:	c3                   	ret    
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	75 12                	jne    313 <strchr+0x23>
 301:	eb 1d                	jmp    320 <strchr+0x30>
 303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 307:	90                   	nop
 308:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 30c:	83 c0 01             	add    $0x1,%eax
 30f:	84 d2                	test   %dl,%dl
 311:	74 0d                	je     320 <strchr+0x30>
    if(*s == c)
 313:	38 d1                	cmp    %dl,%cl
 315:	75 f1                	jne    308 <strchr+0x18>
      return (char*)s;
  return 0;
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 320:	31 c0                	xor    %eax,%eax
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    
 324:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 335:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 338:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 339:	31 db                	xor    %ebx,%ebx
{
 33b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 33e:	eb 27                	jmp    367 <gets+0x37>
    cc = read(0, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	6a 01                	push   $0x1
 345:	57                   	push   %edi
 346:	6a 00                	push   $0x0
 348:	e8 2e 01 00 00       	call   47b <read>
    if(cc < 1)
 34d:	83 c4 10             	add    $0x10,%esp
 350:	85 c0                	test   %eax,%eax
 352:	7e 1d                	jle    371 <gets+0x41>
      break;
    buf[i++] = c;
 354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 35f:	3c 0a                	cmp    $0xa,%al
 361:	74 1d                	je     380 <gets+0x50>
 363:	3c 0d                	cmp    $0xd,%al
 365:	74 19                	je     380 <gets+0x50>
  for(i=0; i+1 < max; ){
 367:	89 de                	mov    %ebx,%esi
 369:	83 c3 01             	add    $0x1,%ebx
 36c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36f:	7c cf                	jl     340 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 378:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37b:	5b                   	pop    %ebx
 37c:	5e                   	pop    %esi
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    
  buf[i] = '\0';
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	89 de                	mov    %ebx,%esi
 385:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 389:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	6a 00                	push   $0x0
 3aa:	ff 75 08             	pushl  0x8(%ebp)
 3ad:	e8 f1 00 00 00       	call   4a3 <open>
  if(fd < 0)
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	78 27                	js     3e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	ff 75 0c             	pushl  0xc(%ebp)
 3bf:	89 c3                	mov    %eax,%ebx
 3c1:	50                   	push   %eax
 3c2:	e8 f4 00 00 00       	call   4bb <fstat>
  close(fd);
 3c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ca:	89 c6                	mov    %eax,%esi
  close(fd);
 3cc:	e8 ba 00 00 00       	call   48b <close>
  return r;
 3d1:	83 c4 10             	add    $0x10,%esp
}
 3d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d7:	89 f0                	mov    %esi,%eax
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e5:	eb ed                	jmp    3d4 <stat+0x34>
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <atoi>:

int
atoi(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3f7:	0f be 02             	movsbl (%edx),%eax
 3fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 400:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 405:	77 1e                	ja     425 <atoi+0x35>
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 410:	83 c2 01             	add    $0x1,%edx
 413:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 416:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 41a:	0f be 02             	movsbl (%edx),%eax
 41d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 420:	80 fb 09             	cmp    $0x9,%bl
 423:	76 eb                	jbe    410 <atoi+0x20>
  return n;
}
 425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 428:	89 c8                	mov    %ecx,%eax
 42a:	c9                   	leave  
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	8b 45 10             	mov    0x10(%ebp),%eax
 437:	8b 55 08             	mov    0x8(%ebp),%edx
 43a:	56                   	push   %esi
 43b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 43e:	85 c0                	test   %eax,%eax
 440:	7e 13                	jle    455 <memmove+0x25>
 442:	01 d0                	add    %edx,%eax
  dst = vdst;
 444:	89 d7                	mov    %edx,%edi
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 450:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 451:	39 f8                	cmp    %edi,%eax
 453:	75 fb                	jne    450 <memmove+0x20>
  return vdst;
}
 455:	5e                   	pop    %esi
 456:	89 d0                	mov    %edx,%eax
 458:	5f                   	pop    %edi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    

0000045b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45b:	b8 01 00 00 00       	mov    $0x1,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <exit>:
SYSCALL(exit)
 463:	b8 02 00 00 00       	mov    $0x2,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <wait>:
SYSCALL(wait)
 46b:	b8 03 00 00 00       	mov    $0x3,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <pipe>:
SYSCALL(pipe)
 473:	b8 04 00 00 00       	mov    $0x4,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <read>:
SYSCALL(read)
 47b:	b8 05 00 00 00       	mov    $0x5,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <write>:
SYSCALL(write)
 483:	b8 10 00 00 00       	mov    $0x10,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <close>:
SYSCALL(close)
 48b:	b8 15 00 00 00       	mov    $0x15,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <kill>:
SYSCALL(kill)
 493:	b8 06 00 00 00       	mov    $0x6,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <exec>:
SYSCALL(exec)
 49b:	b8 07 00 00 00       	mov    $0x7,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <open>:
SYSCALL(open)
 4a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <mknod>:
SYSCALL(mknod)
 4ab:	b8 11 00 00 00       	mov    $0x11,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <unlink>:
SYSCALL(unlink)
 4b3:	b8 12 00 00 00       	mov    $0x12,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <fstat>:
SYSCALL(fstat)
 4bb:	b8 08 00 00 00       	mov    $0x8,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <link>:
SYSCALL(link)
 4c3:	b8 13 00 00 00       	mov    $0x13,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <mkdir>:
SYSCALL(mkdir)
 4cb:	b8 14 00 00 00       	mov    $0x14,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <chdir>:
SYSCALL(chdir)
 4d3:	b8 09 00 00 00       	mov    $0x9,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <dup>:
SYSCALL(dup)
 4db:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <getpid>:
SYSCALL(getpid)
 4e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <sbrk>:
SYSCALL(sbrk)
 4eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <sleep>:
SYSCALL(sleep)
 4f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <uptime>:
SYSCALL(uptime)
 4fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    
 503:	66 90                	xchg   %ax,%ax
 505:	66 90                	xchg   %ax,%ax
 507:	66 90                	xchg   %ax,%ax
 509:	66 90                	xchg   %ax,%ax
 50b:	66 90                	xchg   %ax,%ax
 50d:	66 90                	xchg   %ax,%ax
 50f:	90                   	nop

00000510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 3c             	sub    $0x3c,%esp
 519:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 51c:	89 d1                	mov    %edx,%ecx
{
 51e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 521:	85 d2                	test   %edx,%edx
 523:	0f 89 7f 00 00 00    	jns    5a8 <printint+0x98>
 529:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 52d:	74 79                	je     5a8 <printint+0x98>
    neg = 1;
 52f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 536:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 538:	31 db                	xor    %ebx,%ebx
 53a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 cf                	mov    %ecx,%edi
 546:	f7 75 c4             	divl   -0x3c(%ebp)
 549:	0f b6 92 74 0c 00 00 	movzbl 0xc74(%edx),%edx
 550:	89 45 c0             	mov    %eax,-0x40(%ebp)
 553:	89 d8                	mov    %ebx,%eax
 555:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 558:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 55b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 55e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 561:	76 dd                	jbe    540 <printint+0x30>
  if(neg)
 563:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 566:	85 c9                	test   %ecx,%ecx
 568:	74 0c                	je     576 <printint+0x66>
    buf[i++] = '-';
 56a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 56f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 571:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 576:	8b 7d b8             	mov    -0x48(%ebp),%edi
 579:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 57d:	eb 07                	jmp    586 <printint+0x76>
 57f:	90                   	nop
    putc(fd, buf[i]);
 580:	0f b6 13             	movzbl (%ebx),%edx
 583:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 586:	83 ec 04             	sub    $0x4,%esp
 589:	88 55 d7             	mov    %dl,-0x29(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	56                   	push   %esi
 58f:	57                   	push   %edi
 590:	e8 ee fe ff ff       	call   483 <write>
  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x70>
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5af:	eb 87                	jmp    538 <printint+0x28>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 13             	movzbl (%ebx),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	74 6a                	je     640 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5d6:	8d 45 10             	lea    0x10(%ebp),%eax
 5d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	eb 36                	jmp    61c <printf+0x5c>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	74 15                	je     612 <printf+0x52>
  write(fd, &c, 1);
 5fd:	83 ec 04             	sub    $0x4,%esp
 600:	88 55 e7             	mov    %dl,-0x19(%ebp)
 603:	6a 01                	push   $0x1
 605:	57                   	push   %edi
 606:	56                   	push   %esi
 607:	e8 77 fe ff ff       	call   483 <write>
 60c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 60f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 612:	0f b6 13             	movzbl (%ebx),%edx
 615:	83 c3 01             	add    $0x1,%ebx
 618:	84 d2                	test   %dl,%dl
 61a:	74 24                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 61c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 61f:	85 c9                	test   %ecx,%ecx
 621:	74 cd                	je     5f0 <printf+0x30>
      }
    } else if(state == '%'){
 623:	83 f9 25             	cmp    $0x25,%ecx
 626:	75 ea                	jne    612 <printf+0x52>
      if(c == 'd'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 07 01 00 00    	je     738 <printf+0x178>
 631:	83 e8 63             	sub    $0x63,%eax
 634:	83 f8 15             	cmp    $0x15,%eax
 637:	77 17                	ja     650 <printf+0x90>
 639:	ff 24 85 1c 0c 00 00 	jmp    *0xc1c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 656:	6a 01                	push   $0x1
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65e:	e8 20 fe ff ff       	call   483 <write>
        putc(fd, c);
 663:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 667:	83 c4 0c             	add    $0xc,%esp
 66a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 66d:	6a 01                	push   $0x1
 66f:	57                   	push   %edi
 670:	56                   	push   %esi
 671:	e8 0d fe ff ff       	call   483 <write>
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      state = 0;
 679:	31 c9                	xor    %ecx,%ecx
 67b:	eb 95                	jmp    612 <printf+0x52>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	89 f0                	mov    %esi,%eax
 691:	e8 7a fe ff ff       	call   510 <printint>
        ap++;
 696:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 69a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69d:	31 c9                	xor    %ecx,%ecx
 69f:	e9 6e ff ff ff       	jmp    612 <printf+0x52>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ab:	8b 10                	mov    (%eax),%edx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b3:	85 d2                	test   %edx,%edx
 6b5:	0f 84 8d 00 00 00    	je     748 <printf+0x188>
        while(*s != 0){
 6bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6c0:	84 c0                	test   %al,%al
 6c2:	0f 84 4a ff ff ff    	je     612 <printf+0x52>
 6c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6cb:	89 d3                	mov    %edx,%ebx
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6d3:	83 c3 01             	add    $0x1,%ebx
 6d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	e8 a1 fd ff ff       	call   483 <write>
        while(*s != 0){
 6e2:	0f b6 03             	movzbl (%ebx),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6ef:	31 c9                	xor    %ecx,%ecx
 6f1:	e9 1c ff ff ff       	jmp    612 <printf+0x52>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 7b ff ff ff       	jmp    68a <printf+0xca>
 70f:	90                   	nop
        putc(fd, *ap);
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
        putc(fd, *ap);
 71c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 71f:	e8 5f fd ff ff       	call   483 <write>
        ap++;
 724:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	31 c9                	xor    %ecx,%ecx
 72d:	e9 e0 fe ff ff       	jmp    612 <printf+0x52>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 738:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	e9 2a ff ff ff       	jmp    66d <printf+0xad>
 743:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 747:	90                   	nop
          s = "(null)";
 748:	ba 14 0c 00 00       	mov    $0xc14,%edx
        while(*s != 0){
 74d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 750:	b8 28 00 00 00       	mov    $0x28,%eax
 755:	89 d3                	mov    %edx,%ebx
 757:	e9 74 ff ff ff       	jmp    6d0 <printf+0x110>
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 00 11 00 00       	mov    0x1100,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 778:	89 c2                	mov    %eax,%edx
 77a:	8b 00                	mov    (%eax),%eax
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	73 30                	jae    7b0 <free+0x50>
 780:	39 c1                	cmp    %eax,%ecx
 782:	72 04                	jb     788 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 c2                	cmp    %eax,%edx
 786:	72 f0                	jb     778 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	74 30                	je     7c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 792:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 795:	8b 42 04             	mov    0x4(%edx),%eax
 798:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 3a                	je     7d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	89 15 00 11 00 00    	mov    %edx,0x1100
}
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 c2                	cmp    %eax,%edx
 7b2:	72 c4                	jb     778 <free+0x18>
 7b4:	39 c1                	cmp    %eax,%ecx
 7b6:	73 c0                	jae    778 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	75 d0                	jne    792 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7c2:	03 70 04             	add    0x4(%eax),%esi
 7c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cf:	8b 42 04             	mov    0x4(%edx),%eax
 7d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d5:	39 f1                	cmp    %esi,%ecx
 7d7:	75 c6                	jne    79f <free+0x3f>
    p->s.size += bp->s.size;
 7d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7dc:	89 15 00 11 00 00    	mov    %edx,0x1100
    p->s.size += bp->s.size;
 7e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e8:	89 0a                	mov    %ecx,(%edx)
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d 00 11 00 00    	mov    0x1100,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	73 6a                	jae    886 <malloc+0x96>
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 de                	cmp    %ebx,%esi
 823:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 830:	eb 17                	jmp    849 <malloc+0x59>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f1                	cmp    %esi,%ecx
 83f:	73 4f                	jae    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	8b 3d 00 11 00 00    	mov    0x1100,%edi
 847:	89 c2                	mov    %eax,%edx
 849:	39 d7                	cmp    %edx,%edi
 84b:	75 eb                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	ff 75 e4             	pushl  -0x1c(%ebp)
 853:	e8 93 fc ff ff       	call   4eb <sbrk>
  if(p == (char*)-1)
 858:	83 c4 10             	add    $0x10,%esp
 85b:	83 f8 ff             	cmp    $0xffffffff,%eax
 85e:	74 1c                	je     87c <malloc+0x8c>
  hp->s.size = nu;
 860:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	83 c0 08             	add    $0x8,%eax
 869:	50                   	push   %eax
 86a:	e8 f1 fe ff ff       	call   760 <free>
  return freep;
 86f:	8b 15 00 11 00 00    	mov    0x1100,%edx
      if((p = morecore(nunits)) == 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	85 d2                	test   %edx,%edx
 87a:	75 bc                	jne    838 <malloc+0x48>
        return 0;
  }
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87f:	31 c0                	xor    %eax,%eax
}
 881:	5b                   	pop    %ebx
 882:	5e                   	pop    %esi
 883:	5f                   	pop    %edi
 884:	5d                   	pop    %ebp
 885:	c3                   	ret    
    if(p->s.size >= nunits){
 886:	89 d0                	mov    %edx,%eax
 888:	89 fa                	mov    %edi,%edx
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 ce                	cmp    %ecx,%esi
 892:	74 4c                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 894:	29 f1                	sub    %esi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 89f:	89 15 00 11 00 00    	mov    %edx,0x1100
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 00 11 00 00 04 	movl   $0x1104,0x1100
 8b7:	11 00 00 
    base.s.size = 0;
 8ba:	bf 04 11 00 00       	mov    $0x1104,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 04 11 00 00 04 	movl   $0x1104,0x1104
 8c6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8cb:	c7 05 08 11 00 00 00 	movl   $0x0,0x1108
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 42 ff ff ff       	jmp    81c <malloc+0x2c>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0xaf>
 8e6:	66 90                	xchg   %ax,%ax
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <thread_init>:
}

void thread_init(void) {
  int i;
  for (i = 0; i < MAX_THREADS; i++) {
    thread_table[i].state = UNUSED;
 8f0:	c7 05 54 11 00 00 00 	movl   $0x0,0x1154
 8f7:	00 00 00 
 8fa:	c7 05 64 11 00 00 00 	movl   $0x0,0x1164
 901:	00 00 00 
 904:	c7 05 74 11 00 00 00 	movl   $0x0,0x1174
 90b:	00 00 00 
 90e:	c7 05 84 11 00 00 00 	movl   $0x0,0x1184
 915:	00 00 00 
 918:	c7 05 94 11 00 00 00 	movl   $0x0,0x1194
 91f:	00 00 00 
 922:	c7 05 a4 11 00 00 00 	movl   $0x0,0x11a4
 929:	00 00 00 
 92c:	c7 05 b4 11 00 00 00 	movl   $0x0,0x11b4
 933:	00 00 00 
  }
  current_thread = &thread_table[0];
 936:	c7 05 20 11 00 00 40 	movl   $0x1140,0x1120
 93d:	11 00 00 
  current_thread->state = RUNNING;
 940:	c7 05 44 11 00 00 02 	movl   $0x2,0x1144
 947:	00 00 00 
  current_thread->tid = 0;
 94a:	c7 05 4c 11 00 00 00 	movl   $0x0,0x114c
 951:	00 00 00 
}
 954:	c3                   	ret    
 955:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000960 <thread_create>:

tid_t thread_create(void (*fn)(void*), void *arg) {
 960:	55                   	push   %ebp
  struct thread *t = 0;
  int i;

  for (i = 0; i < MAX_THREADS; i++) {
 961:	31 c0                	xor    %eax,%eax
tid_t thread_create(void (*fn)(void*), void *arg) {
 963:	89 e5                	mov    %esp,%ebp
 965:	53                   	push   %ebx
 966:	83 ec 04             	sub    $0x4,%esp
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (thread_table[i].state == UNUSED) {
 970:	89 c3                	mov    %eax,%ebx
 972:	c1 e3 04             	shl    $0x4,%ebx
 975:	8b 93 44 11 00 00    	mov    0x1144(%ebx),%edx
 97b:	85 d2                	test   %edx,%edx
 97d:	74 19                	je     998 <thread_create+0x38>
  for (i = 0; i < MAX_THREADS; i++) {
 97f:	83 c0 01             	add    $0x1,%eax
 982:	83 f8 08             	cmp    $0x8,%eax
 985:	75 e9                	jne    970 <thread_create+0x10>
  t->context->eip = (uint)thread_stub;
  t->state = RUNNABLE;
  t->tid = (int)(t - thread_table);

  return t->tid;
}
 987:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  if (!t) return -1;
 98a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 98f:	c9                   	leave  
 990:	c3                   	ret    
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  t->stack = malloc(STACK_SIZE);
 998:	83 ec 0c             	sub    $0xc,%esp
 99b:	68 00 10 00 00       	push   $0x1000
 9a0:	e8 4b fe ff ff       	call   7f0 <malloc>
  sp -= 4; *(uint*)sp = (uint)arg;
 9a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  t->tid = (int)(t - thread_table);
 9a8:	83 c4 10             	add    $0x10,%esp
  t->state = RUNNABLE;
 9ab:	c7 83 44 11 00 00 01 	movl   $0x1,0x1144(%ebx)
 9b2:	00 00 00 
  t->stack = malloc(STACK_SIZE);
 9b5:	89 83 40 11 00 00    	mov    %eax,0x1140(%ebx)
  sp -= 4; *(uint*)sp = (uint)arg;
 9bb:	89 88 fc 0f 00 00    	mov    %ecx,0xffc(%eax)
  sp -= 4; *(uint*)sp = (uint)fn;
 9c1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  sp -= 4; *(uint*)sp = 0;
 9c4:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 9cb:	00 00 00 
  sp -= 4; *(uint*)sp = (uint)fn;
 9ce:	89 88 f8 0f 00 00    	mov    %ecx,0xff8(%eax)
  sp -= sizeof(struct context);
 9d4:	8d 88 e0 0f 00 00    	lea    0xfe0(%eax),%ecx
  t->context->eip = (uint)thread_stub;
 9da:	c7 80 f0 0f 00 00 b0 	movl   $0xab0,0xff0(%eax)
 9e1:	0a 00 00 
  t->tid = (int)(t - thread_table);
 9e4:	89 d8                	mov    %ebx,%eax
 9e6:	c1 f8 04             	sar    $0x4,%eax
  sp -= sizeof(struct context);
 9e9:	89 8b 48 11 00 00    	mov    %ecx,0x1148(%ebx)
  t->tid = (int)(t - thread_table);
 9ef:	89 83 4c 11 00 00    	mov    %eax,0x114c(%ebx)
}
 9f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9f8:	c9                   	leave  
 9f9:	c3                   	ret    
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a00 <thread_yield>:

void thread_yield(void) {
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	57                   	push   %edi
 a04:	56                   	push   %esi
 a05:	53                   	push   %ebx
 a06:	83 ec 0c             	sub    $0xc,%esp
  struct thread *prev = current_thread;
 a09:	8b 35 20 11 00 00    	mov    0x1120,%esi
  struct thread *next = 0;
  int i, idx;
  int start = (prev->tid + 1) % MAX_THREADS;
 a0f:	8b 46 0c             	mov    0xc(%esi),%eax
 a12:	83 c0 01             	add    $0x1,%eax
 a15:	99                   	cltd   
 a16:	c1 ea 1d             	shr    $0x1d,%edx
 a19:	01 d0                	add    %edx,%eax
 a1b:	83 e0 07             	and    $0x7,%eax
 a1e:	29 d0                	sub    %edx,%eax
 a20:	8d 58 08             	lea    0x8(%eax),%ebx
 a23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a27:	90                   	nop

  for (i = 0; i < MAX_THREADS; i++) {
    idx = (start + i) % MAX_THREADS;
 a28:	89 c1                	mov    %eax,%ecx
 a2a:	c1 f9 1f             	sar    $0x1f,%ecx
 a2d:	c1 e9 1d             	shr    $0x1d,%ecx
 a30:	8d 14 08             	lea    (%eax,%ecx,1),%edx
 a33:	83 e2 07             	and    $0x7,%edx
 a36:	29 ca                	sub    %ecx,%edx
    if (thread_table[idx].state == RUNNABLE) {
 a38:	89 d1                	mov    %edx,%ecx
 a3a:	c1 e1 04             	shl    $0x4,%ecx
 a3d:	83 b9 44 11 00 00 01 	cmpl   $0x1,0x1144(%ecx)
 a44:	8d b9 40 11 00 00    	lea    0x1140(%ecx),%edi
 a4a:	74 14                	je     a60 <thread_yield+0x60>
  for (i = 0; i < MAX_THREADS; i++) {
 a4c:	83 c0 01             	add    $0x1,%eax
 a4f:	39 c3                	cmp    %eax,%ebx
 a51:	75 d5                	jne    a28 <thread_yield+0x28>
    if (prev->state == RUNNING) prev->state = RUNNABLE;
    next->state = RUNNING;
    current_thread = next;
    uswtch(&prev->context, next->context);
  }
}
 a53:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a56:	5b                   	pop    %ebx
 a57:	5e                   	pop    %esi
 a58:	5f                   	pop    %edi
 a59:	5d                   	pop    %ebp
 a5a:	c3                   	ret    
 a5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a5f:	90                   	nop
  if (next && next != prev) {
 a60:	39 fe                	cmp    %edi,%esi
 a62:	74 ef                	je     a53 <thread_yield+0x53>
    if (prev->state == RUNNING) prev->state = RUNNABLE;
 a64:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
 a68:	74 36                	je     aa0 <thread_yield+0xa0>
    uswtch(&prev->context, next->context);
 a6a:	83 ec 08             	sub    $0x8,%esp
    next->state = RUNNING;
 a6d:	c1 e2 04             	shl    $0x4,%edx
    uswtch(&prev->context, next->context);
 a70:	83 c6 08             	add    $0x8,%esi
    current_thread = next;
 a73:	89 3d 20 11 00 00    	mov    %edi,0x1120
    uswtch(&prev->context, next->context);
 a79:	ff b2 48 11 00 00    	pushl  0x1148(%edx)
 a7f:	56                   	push   %esi
    next->state = RUNNING;
 a80:	c7 82 44 11 00 00 02 	movl   $0x2,0x1144(%edx)
 a87:	00 00 00 
    uswtch(&prev->context, next->context);
 a8a:	e8 2f 01 00 00       	call   bbe <uswtch>
 a8f:	83 c4 10             	add    $0x10,%esp
}
 a92:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a95:	5b                   	pop    %ebx
 a96:	5e                   	pop    %esi
 a97:	5f                   	pop    %edi
 a98:	5d                   	pop    %ebp
 a99:	c3                   	ret    
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (prev->state == RUNNING) prev->state = RUNNABLE;
 aa0:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
 aa7:	eb c1                	jmp    a6a <thread_yield+0x6a>
 aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <thread_stub>:
void thread_stub(void (*fn)(void*), void *arg) {
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	83 ec 14             	sub    $0x14,%esp
  fn(arg);
 ab6:	ff 75 0c             	pushl  0xc(%ebp)
 ab9:	ff 55 08             	call   *0x8(%ebp)
  current_thread->state = ZOMBIE;
 abc:	a1 20 11 00 00       	mov    0x1120,%eax
  thread_yield();
 ac1:	83 c4 10             	add    $0x10,%esp
  current_thread->state = ZOMBIE;
 ac4:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
}
 acb:	c9                   	leave  
  thread_yield();
 acc:	e9 2f ff ff ff       	jmp    a00 <thread_yield>
 ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 adf:	90                   	nop

00000ae0 <thread_join>:

int thread_join(tid_t tid) {
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	57                   	push   %edi
 ae4:	56                   	push   %esi
 ae5:	53                   	push   %ebx
 ae6:	83 ec 0c             	sub    $0xc,%esp
 ae9:	8b 75 08             	mov    0x8(%ebp),%esi
  if (tid < 0 || tid >= MAX_THREADS) return -1;
 aec:	83 fe 07             	cmp    $0x7,%esi
 aef:	77 6f                	ja     b60 <thread_join+0x80>

  while (thread_table[tid].state != ZOMBIE && thread_table[tid].state != UNUSED) {
 af1:	89 f3                	mov    %esi,%ebx
 af3:	c1 e3 04             	shl    $0x4,%ebx
 af6:	81 c3 40 11 00 00    	add    $0x1140,%ebx
 afc:	8b 43 04             	mov    0x4(%ebx),%eax
 aff:	83 f8 03             	cmp    $0x3,%eax
 b02:	75 19                	jne    b1d <thread_join+0x3d>
 b04:	eb 1b                	jmp    b21 <thread_join+0x41>
 b06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b0d:	8d 76 00             	lea    0x0(%esi),%esi
    thread_yield();
 b10:	e8 eb fe ff ff       	call   a00 <thread_yield>
  while (thread_table[tid].state != ZOMBIE && thread_table[tid].state != UNUSED) {
 b15:	8b 43 04             	mov    0x4(%ebx),%eax
 b18:	83 f8 03             	cmp    $0x3,%eax
 b1b:	74 04                	je     b21 <thread_join+0x41>
 b1d:	85 c0                	test   %eax,%eax
 b1f:	75 ef                	jne    b10 <thread_join+0x30>
  if (thread_table[tid].state == ZOMBIE) {
    free(thread_table[tid].stack);
    thread_table[tid].state = UNUSED;
  }

  return 0;
 b21:	31 db                	xor    %ebx,%ebx
  if (thread_table[tid].state == ZOMBIE) {
 b23:	83 f8 03             	cmp    $0x3,%eax
 b26:	74 10                	je     b38 <thread_join+0x58>
 b28:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b2b:	89 d8                	mov    %ebx,%eax
 b2d:	5b                   	pop    %ebx
 b2e:	5e                   	pop    %esi
 b2f:	5f                   	pop    %edi
 b30:	5d                   	pop    %ebp
 b31:	c3                   	ret    
 b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(thread_table[tid].stack);
 b38:	c1 e6 04             	shl    $0x4,%esi
 b3b:	83 ec 0c             	sub    $0xc,%esp
 b3e:	ff b6 40 11 00 00    	pushl  0x1140(%esi)
 b44:	e8 17 fc ff ff       	call   760 <free>
    thread_table[tid].state = UNUSED;
 b49:	83 c4 10             	add    $0x10,%esp
 b4c:	89 d8                	mov    %ebx,%eax
    thread_table[tid].state = UNUSED;
 b4e:	c7 86 44 11 00 00 00 	movl   $0x0,0x1144(%esi)
 b55:	00 00 00 
 b58:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b5b:	5b                   	pop    %ebx
 b5c:	5e                   	pop    %esi
 b5d:	5f                   	pop    %edi
 b5e:	5d                   	pop    %ebp
 b5f:	c3                   	ret    
  if (tid < 0 || tid >= MAX_THREADS) return -1;
 b60:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 b65:	eb c1                	jmp    b28 <thread_join+0x48>
 b67:	66 90                	xchg   %ax,%ax
 b69:	66 90                	xchg   %ax,%ax
 b6b:	66 90                	xchg   %ax,%ax
 b6d:	66 90                	xchg   %ax,%ax
 b6f:	90                   	nop

00000b70 <mutex_init>:
#include "types.h"
#include "uthread.h"
#include "umutex.h"

void mutex_init(umutex_t *m) {
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
  m->locked = 0;
 b73:	8b 45 08             	mov    0x8(%ebp),%eax
 b76:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b7c:	5d                   	pop    %ebp
 b7d:	c3                   	ret    
 b7e:	66 90                	xchg   %ax,%ax

00000b80 <mutex_lock>:

void mutex_lock(umutex_t *m) {
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	53                   	push   %ebx
 b84:	83 ec 04             	sub    $0x4,%esp
 b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while (m->locked) {
 b8a:	8b 13                	mov    (%ebx),%edx
 b8c:	85 d2                	test   %edx,%edx
 b8e:	74 0b                	je     b9b <mutex_lock+0x1b>
    thread_yield();
 b90:	e8 6b fe ff ff       	call   a00 <thread_yield>
  while (m->locked) {
 b95:	8b 03                	mov    (%ebx),%eax
 b97:	85 c0                	test   %eax,%eax
 b99:	75 f5                	jne    b90 <mutex_lock+0x10>
  }
  m->locked = 1;
 b9b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
 ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ba4:	c9                   	leave  
 ba5:	c3                   	ret    
 ba6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bad:	8d 76 00             	lea    0x0(%esi),%esi

00000bb0 <mutex_unlock>:
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	8b 45 08             	mov    0x8(%ebp),%eax
 bb6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 bbc:	5d                   	pop    %ebp
 bbd:	c3                   	ret    

00000bbe <uswtch>:
# User-space context switch for xv6 x86
# void uswtch(struct context **old, struct context *new);
.globl uswtch
uswtch:
movl 4(%esp), %eax
 bbe:	8b 44 24 04          	mov    0x4(%esp),%eax
movl 8(%esp), %edx
 bc2:	8b 54 24 08          	mov    0x8(%esp),%edx
pushl %ebp
 bc6:	55                   	push   %ebp
pushl %ebx
 bc7:	53                   	push   %ebx
pushl %esi
 bc8:	56                   	push   %esi
pushl %edi
 bc9:	57                   	push   %edi
movl %esp, (%eax)
 bca:	89 20                	mov    %esp,(%eax)
movl %edx, %esp
 bcc:	89 d4                	mov    %edx,%esp
popl %edi
 bce:	5f                   	pop    %edi
popl %esi
 bcf:	5e                   	pop    %esi
popl %ebx
 bd0:	5b                   	pop    %ebx
popl %ebp
 bd1:	5d                   	pop    %ebp
ret
 bd2:	c3                   	ret    
