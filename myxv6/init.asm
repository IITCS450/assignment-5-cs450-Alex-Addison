
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 b4 0a 00 00       	push   $0xab4
  19:	e8 65 03 00 00       	call   383 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 88 03 00 00       	call   3bb <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7c 03 00 00       	call   3bb <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 bc 0a 00 00       	push   $0xabc
  50:	6a 01                	push   $0x1
  52:	e8 49 04 00 00       	call   4a0 <printf>
    pid = fork();
  57:	e8 df 02 00 00       	call   33b <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 d6 02 00 00       	call   34b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 fb 0a 00 00       	push   $0xafb
  85:	6a 01                	push   $0x1
  87:	e8 14 04 00 00       	call   4a0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 cf 0a 00 00       	push   $0xacf
  98:	6a 01                	push   $0x1
  9a:	e8 01 04 00 00       	call   4a0 <printf>
      exit();
  9f:	e8 9f 02 00 00       	call   343 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 54 0f 00 00       	push   $0xf54
  ab:	68 e2 0a 00 00       	push   $0xae2
  b0:	e8 c6 02 00 00       	call   37b <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 e5 0a 00 00       	push   $0xae5
  bc:	6a 01                	push   $0x1
  be:	e8 dd 03 00 00       	call   4a0 <printf>
      exit();
  c3:	e8 7b 02 00 00       	call   343 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 b4 0a 00 00       	push   $0xab4
  d2:	e8 b4 02 00 00       	call   38b <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 b4 0a 00 00       	push   $0xab4
  e0:	e8 9e 02 00 00       	call   383 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 2e 01 00 00       	call   35b <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 ba 00 00 00       	call   36b <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    
 3e3:	66 90                	xchg   %ax,%ax
 3e5:	66 90                	xchg   %ax,%ax
 3e7:	66 90                	xchg   %ax,%ax
 3e9:	66 90                	xchg   %ax,%ax
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3fc:	89 d1                	mov    %edx,%ecx
{
 3fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 401:	85 d2                	test   %edx,%edx
 403:	0f 89 7f 00 00 00    	jns    488 <printint+0x98>
 409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40d:	74 79                	je     488 <printint+0x98>
    neg = 1;
 40f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 418:	31 db                	xor    %ebx,%ebx
 41a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 64 0b 00 00 	movzbl 0xb64(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 441:	76 dd                	jbe    420 <printint+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8b 7d b8             	mov    -0x48(%ebp),%edi
 459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45d:	eb 07                	jmp    466 <printint+0x76>
 45f:	90                   	nop
    putc(fd, buf[i]);
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 ee fe ff ff       	call   363 <write>
  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x70>
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 48f:	eb 87                	jmp    418 <printint+0x28>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 13             	movzbl (%ebx),%edx
 4b2:	84 d2                	test   %dl,%dl
 4b4:	74 6a                	je     520 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
 4b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c4:	eb 36                	jmp    4fc <printf+0x5c>
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
 4d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 15                	je     4f2 <printf+0x52>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	56                   	push   %esi
 4e7:	e8 77 fe ff ff       	call   363 <write>
 4ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 13             	movzbl (%ebx),%edx
 4f5:	83 c3 01             	add    $0x1,%ebx
 4f8:	84 d2                	test   %dl,%dl
 4fa:	74 24                	je     520 <printf+0x80>
    c = fmt[i] & 0xff;
 4fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ff:	85 c9                	test   %ecx,%ecx
 501:	74 cd                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 503:	83 f9 25             	cmp    $0x25,%ecx
 506:	75 ea                	jne    4f2 <printf+0x52>
      if(c == 'd'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 07 01 00 00    	je     618 <printf+0x178>
 511:	83 e8 63             	sub    $0x63,%eax
 514:	83 f8 15             	cmp    $0x15,%eax
 517:	77 17                	ja     530 <printf+0x90>
 519:	ff 24 85 0c 0b 00 00 	jmp    *0xb0c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 536:	6a 01                	push   $0x1
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53e:	e8 20 fe ff ff       	call   363 <write>
        putc(fd, c);
 543:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 547:	83 c4 0c             	add    $0xc,%esp
 54a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54d:	6a 01                	push   $0x1
 54f:	57                   	push   %edi
 550:	56                   	push   %esi
 551:	e8 0d fe ff ff       	call   363 <write>
        putc(fd, c);
 556:	83 c4 10             	add    $0x10,%esp
      state = 0;
 559:	31 c9                	xor    %ecx,%ecx
 55b:	eb 95                	jmp    4f2 <printf+0x52>
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 56d:	8b 10                	mov    (%eax),%edx
 56f:	89 f0                	mov    %esi,%eax
 571:	e8 7a fe ff ff       	call   3f0 <printint>
        ap++;
 576:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 57a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57d:	31 c9                	xor    %ecx,%ecx
 57f:	e9 6e ff ff ff       	jmp    4f2 <printf+0x52>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 588:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58b:	8b 10                	mov    (%eax),%edx
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 593:	85 d2                	test   %edx,%edx
 595:	0f 84 8d 00 00 00    	je     628 <printf+0x188>
        while(*s != 0){
 59b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 59e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 4a ff ff ff    	je     4f2 <printf+0x52>
 5a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5ab:	89 d3                	mov    %edx,%ebx
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	56                   	push   %esi
 5bd:	e8 a1 fd ff ff       	call   363 <write>
        while(*s != 0){
 5c2:	0f b6 03             	movzbl (%ebx),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x110>
      state = 0;
 5cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5cf:	31 c9                	xor    %ecx,%ecx
 5d1:	e9 1c ff ff ff       	jmp    4f2 <printf+0x52>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	e9 7b ff ff ff       	jmp    56a <printf+0xca>
 5ef:	90                   	nop
        putc(fd, *ap);
 5f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	57                   	push   %edi
 5fb:	56                   	push   %esi
        putc(fd, *ap);
 5fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ff:	e8 5f fd ff ff       	call   363 <write>
        ap++;
 604:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 c9                	xor    %ecx,%ecx
 60d:	e9 e0 fe ff ff       	jmp    4f2 <printf+0x52>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 618:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	e9 2a ff ff ff       	jmp    54d <printf+0xad>
 623:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 627:	90                   	nop
          s = "(null)";
 628:	ba 04 0b 00 00       	mov    $0xb04,%edx
        while(*s != 0){
 62d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 630:	b8 28 00 00 00       	mov    $0x28,%eax
 635:	89 d3                	mov    %edx,%ebx
 637:	e9 74 ff ff ff       	jmp    5b0 <printf+0x110>
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 60 0f 00 00       	mov    0xf60,%eax
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 64e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 658:	89 c2                	mov    %eax,%edx
 65a:	8b 00                	mov    (%eax),%eax
 65c:	39 ca                	cmp    %ecx,%edx
 65e:	73 30                	jae    690 <free+0x50>
 660:	39 c1                	cmp    %eax,%ecx
 662:	72 04                	jb     668 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 664:	39 c2                	cmp    %eax,%edx
 666:	72 f0                	jb     658 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 f8                	cmp    %edi,%eax
 670:	74 30                	je     6a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 672:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 675:	8b 42 04             	mov    0x4(%edx),%eax
 678:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 67b:	39 f1                	cmp    %esi,%ecx
 67d:	74 3a                	je     6b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 67f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 681:	5b                   	pop    %ebx
  freep = p;
 682:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 c2                	cmp    %eax,%edx
 692:	72 c4                	jb     658 <free+0x18>
 694:	39 c1                	cmp    %eax,%ecx
 696:	73 c0                	jae    658 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	39 f8                	cmp    %edi,%eax
 6a0:	75 d0                	jne    672 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6a2:	03 70 04             	add    0x4(%eax),%esi
 6a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a8:	8b 02                	mov    (%edx),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6af:	8b 42 04             	mov    0x4(%edx),%eax
 6b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6b5:	39 f1                	cmp    %esi,%ecx
 6b7:	75 c6                	jne    67f <free+0x3f>
    p->s.size += bp->s.size;
 6b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6bc:	89 15 60 0f 00 00    	mov    %edx,0xf60
    p->s.size += bp->s.size;
 6c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6c8:	89 0a                	mov    %ecx,(%edx)
}
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5f                   	pop    %edi
 6cd:	5d                   	pop    %ebp
 6ce:	c3                   	ret    
 6cf:	90                   	nop

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 70 07             	lea    0x7(%eax),%esi
 6e5:	c1 ee 03             	shr    $0x3,%esi
 6e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6eb:	85 ff                	test   %edi,%edi
 6ed:	0f 84 9d 00 00 00    	je     790 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6f8:	39 f1                	cmp    %esi,%ecx
 6fa:	73 6a                	jae    766 <malloc+0x96>
 6fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 701:	39 de                	cmp    %ebx,%esi
 703:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 706:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 710:	eb 17                	jmp    729 <malloc+0x59>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 718:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 71a:	8b 48 04             	mov    0x4(%eax),%ecx
 71d:	39 f1                	cmp    %esi,%ecx
 71f:	73 4f                	jae    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 721:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
 727:	89 c2                	mov    %eax,%edx
 729:	39 d7                	cmp    %edx,%edi
 72b:	75 eb                	jne    718 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 72d:	83 ec 0c             	sub    $0xc,%esp
 730:	ff 75 e4             	pushl  -0x1c(%ebp)
 733:	e8 93 fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	83 f8 ff             	cmp    $0xffffffff,%eax
 73e:	74 1c                	je     75c <malloc+0x8c>
  hp->s.size = nu;
 740:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	83 c0 08             	add    $0x8,%eax
 749:	50                   	push   %eax
 74a:	e8 f1 fe ff ff       	call   640 <free>
  return freep;
 74f:	8b 15 60 0f 00 00    	mov    0xf60,%edx
      if((p = morecore(nunits)) == 0)
 755:	83 c4 10             	add    $0x10,%esp
 758:	85 d2                	test   %edx,%edx
 75a:	75 bc                	jne    718 <malloc+0x48>
        return 0;
  }
}
 75c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 75f:	31 c0                	xor    %eax,%eax
}
 761:	5b                   	pop    %ebx
 762:	5e                   	pop    %esi
 763:	5f                   	pop    %edi
 764:	5d                   	pop    %ebp
 765:	c3                   	ret    
    if(p->s.size >= nunits){
 766:	89 d0                	mov    %edx,%eax
 768:	89 fa                	mov    %edi,%edx
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 770:	39 ce                	cmp    %ecx,%esi
 772:	74 4c                	je     7c0 <malloc+0xf0>
        p->s.size -= nunits;
 774:	29 f1                	sub    %esi,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 77f:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 785:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 788:	83 c0 08             	add    $0x8,%eax
}
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 790:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 797:	0f 00 00 
    base.s.size = 0;
 79a:	bf 64 0f 00 00       	mov    $0xf64,%edi
    base.s.ptr = freep = prevp = &base;
 79f:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 7a6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7ab:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 7b2:	00 00 00 
    if(p->s.size >= nunits){
 7b5:	e9 42 ff ff ff       	jmp    6fc <malloc+0x2c>
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7c0:	8b 08                	mov    (%eax),%ecx
 7c2:	89 0a                	mov    %ecx,(%edx)
 7c4:	eb b9                	jmp    77f <malloc+0xaf>
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <thread_init>:
}

void thread_init(void) {
  int i;
  for (i = 0; i < MAX_THREADS; i++) {
    thread_table[i].state = UNUSED;
 7d0:	c7 05 b4 0f 00 00 00 	movl   $0x0,0xfb4
 7d7:	00 00 00 
 7da:	c7 05 c4 0f 00 00 00 	movl   $0x0,0xfc4
 7e1:	00 00 00 
 7e4:	c7 05 d4 0f 00 00 00 	movl   $0x0,0xfd4
 7eb:	00 00 00 
 7ee:	c7 05 e4 0f 00 00 00 	movl   $0x0,0xfe4
 7f5:	00 00 00 
 7f8:	c7 05 f4 0f 00 00 00 	movl   $0x0,0xff4
 7ff:	00 00 00 
 802:	c7 05 04 10 00 00 00 	movl   $0x0,0x1004
 809:	00 00 00 
 80c:	c7 05 14 10 00 00 00 	movl   $0x0,0x1014
 813:	00 00 00 
  }
  current_thread = &thread_table[0];
 816:	c7 05 80 0f 00 00 a0 	movl   $0xfa0,0xf80
 81d:	0f 00 00 
  current_thread->state = RUNNING;
 820:	c7 05 a4 0f 00 00 02 	movl   $0x2,0xfa4
 827:	00 00 00 
  current_thread->tid = 0;
 82a:	c7 05 ac 0f 00 00 00 	movl   $0x0,0xfac
 831:	00 00 00 
}
 834:	c3                   	ret    
 835:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000840 <thread_create>:

tid_t thread_create(void (*fn)(void*), void *arg) {
 840:	55                   	push   %ebp
  struct thread *t = 0;
  int i;

  for (i = 0; i < MAX_THREADS; i++) {
 841:	31 c0                	xor    %eax,%eax
tid_t thread_create(void (*fn)(void*), void *arg) {
 843:	89 e5                	mov    %esp,%ebp
 845:	53                   	push   %ebx
 846:	83 ec 04             	sub    $0x4,%esp
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (thread_table[i].state == UNUSED) {
 850:	89 c3                	mov    %eax,%ebx
 852:	c1 e3 04             	shl    $0x4,%ebx
 855:	8b 93 a4 0f 00 00    	mov    0xfa4(%ebx),%edx
 85b:	85 d2                	test   %edx,%edx
 85d:	74 19                	je     878 <thread_create+0x38>
  for (i = 0; i < MAX_THREADS; i++) {
 85f:	83 c0 01             	add    $0x1,%eax
 862:	83 f8 08             	cmp    $0x8,%eax
 865:	75 e9                	jne    850 <thread_create+0x10>
  t->context->eip = (uint)thread_stub;
  t->state = RUNNABLE;
  t->tid = (int)(t - thread_table);

  return t->tid;
}
 867:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  if (!t) return -1;
 86a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 86f:	c9                   	leave  
 870:	c3                   	ret    
 871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  t->stack = malloc(STACK_SIZE);
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	68 00 10 00 00       	push   $0x1000
 880:	e8 4b fe ff ff       	call   6d0 <malloc>
  sp -= 4; *(uint*)sp = (uint)arg;
 885:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  t->tid = (int)(t - thread_table);
 888:	83 c4 10             	add    $0x10,%esp
  t->state = RUNNABLE;
 88b:	c7 83 a4 0f 00 00 01 	movl   $0x1,0xfa4(%ebx)
 892:	00 00 00 
  t->stack = malloc(STACK_SIZE);
 895:	89 83 a0 0f 00 00    	mov    %eax,0xfa0(%ebx)
  sp -= 4; *(uint*)sp = (uint)arg;
 89b:	89 88 fc 0f 00 00    	mov    %ecx,0xffc(%eax)
  sp -= 4; *(uint*)sp = (uint)fn;
 8a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  sp -= 4; *(uint*)sp = 0;
 8a4:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 8ab:	00 00 00 
  sp -= 4; *(uint*)sp = (uint)fn;
 8ae:	89 88 f8 0f 00 00    	mov    %ecx,0xff8(%eax)
  sp -= sizeof(struct context);
 8b4:	8d 88 e0 0f 00 00    	lea    0xfe0(%eax),%ecx
  t->context->eip = (uint)thread_stub;
 8ba:	c7 80 f0 0f 00 00 90 	movl   $0x990,0xff0(%eax)
 8c1:	09 00 00 
  t->tid = (int)(t - thread_table);
 8c4:	89 d8                	mov    %ebx,%eax
 8c6:	c1 f8 04             	sar    $0x4,%eax
  sp -= sizeof(struct context);
 8c9:	89 8b a8 0f 00 00    	mov    %ecx,0xfa8(%ebx)
  t->tid = (int)(t - thread_table);
 8cf:	89 83 ac 0f 00 00    	mov    %eax,0xfac(%ebx)
}
 8d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d8:	c9                   	leave  
 8d9:	c3                   	ret    
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008e0 <thread_yield>:

void thread_yield(void) {
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	57                   	push   %edi
 8e4:	56                   	push   %esi
 8e5:	53                   	push   %ebx
 8e6:	83 ec 0c             	sub    $0xc,%esp
  struct thread *prev = current_thread;
 8e9:	8b 35 80 0f 00 00    	mov    0xf80,%esi
  struct thread *next = 0;
  int i, idx;
  int start = (prev->tid + 1) % MAX_THREADS;
 8ef:	8b 46 0c             	mov    0xc(%esi),%eax
 8f2:	83 c0 01             	add    $0x1,%eax
 8f5:	99                   	cltd   
 8f6:	c1 ea 1d             	shr    $0x1d,%edx
 8f9:	01 d0                	add    %edx,%eax
 8fb:	83 e0 07             	and    $0x7,%eax
 8fe:	29 d0                	sub    %edx,%eax
 900:	8d 58 08             	lea    0x8(%eax),%ebx
 903:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 907:	90                   	nop

  for (i = 0; i < MAX_THREADS; i++) {
    idx = (start + i) % MAX_THREADS;
 908:	89 c1                	mov    %eax,%ecx
 90a:	c1 f9 1f             	sar    $0x1f,%ecx
 90d:	c1 e9 1d             	shr    $0x1d,%ecx
 910:	8d 14 08             	lea    (%eax,%ecx,1),%edx
 913:	83 e2 07             	and    $0x7,%edx
 916:	29 ca                	sub    %ecx,%edx
    if (thread_table[idx].state == RUNNABLE) {
 918:	89 d1                	mov    %edx,%ecx
 91a:	c1 e1 04             	shl    $0x4,%ecx
 91d:	83 b9 a4 0f 00 00 01 	cmpl   $0x1,0xfa4(%ecx)
 924:	8d b9 a0 0f 00 00    	lea    0xfa0(%ecx),%edi
 92a:	74 14                	je     940 <thread_yield+0x60>
  for (i = 0; i < MAX_THREADS; i++) {
 92c:	83 c0 01             	add    $0x1,%eax
 92f:	39 c3                	cmp    %eax,%ebx
 931:	75 d5                	jne    908 <thread_yield+0x28>
    if (prev->state == RUNNING) prev->state = RUNNABLE;
    next->state = RUNNING;
    current_thread = next;
    uswtch(&prev->context, next->context);
  }
}
 933:	8d 65 f4             	lea    -0xc(%ebp),%esp
 936:	5b                   	pop    %ebx
 937:	5e                   	pop    %esi
 938:	5f                   	pop    %edi
 939:	5d                   	pop    %ebp
 93a:	c3                   	ret    
 93b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 93f:	90                   	nop
  if (next && next != prev) {
 940:	39 fe                	cmp    %edi,%esi
 942:	74 ef                	je     933 <thread_yield+0x53>
    if (prev->state == RUNNING) prev->state = RUNNABLE;
 944:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
 948:	74 36                	je     980 <thread_yield+0xa0>
    uswtch(&prev->context, next->context);
 94a:	83 ec 08             	sub    $0x8,%esp
    next->state = RUNNING;
 94d:	c1 e2 04             	shl    $0x4,%edx
    uswtch(&prev->context, next->context);
 950:	83 c6 08             	add    $0x8,%esi
    current_thread = next;
 953:	89 3d 80 0f 00 00    	mov    %edi,0xf80
    uswtch(&prev->context, next->context);
 959:	ff b2 a8 0f 00 00    	pushl  0xfa8(%edx)
 95f:	56                   	push   %esi
    next->state = RUNNING;
 960:	c7 82 a4 0f 00 00 02 	movl   $0x2,0xfa4(%edx)
 967:	00 00 00 
    uswtch(&prev->context, next->context);
 96a:	e8 2f 01 00 00       	call   a9e <uswtch>
 96f:	83 c4 10             	add    $0x10,%esp
}
 972:	8d 65 f4             	lea    -0xc(%ebp),%esp
 975:	5b                   	pop    %ebx
 976:	5e                   	pop    %esi
 977:	5f                   	pop    %edi
 978:	5d                   	pop    %ebp
 979:	c3                   	ret    
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (prev->state == RUNNING) prev->state = RUNNABLE;
 980:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
 987:	eb c1                	jmp    94a <thread_yield+0x6a>
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000990 <thread_stub>:
void thread_stub(void (*fn)(void*), void *arg) {
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	83 ec 14             	sub    $0x14,%esp
  fn(arg);
 996:	ff 75 0c             	pushl  0xc(%ebp)
 999:	ff 55 08             	call   *0x8(%ebp)
  current_thread->state = ZOMBIE;
 99c:	a1 80 0f 00 00       	mov    0xf80,%eax
  thread_yield();
 9a1:	83 c4 10             	add    $0x10,%esp
  current_thread->state = ZOMBIE;
 9a4:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
}
 9ab:	c9                   	leave  
  thread_yield();
 9ac:	e9 2f ff ff ff       	jmp    8e0 <thread_yield>
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bf:	90                   	nop

000009c0 <thread_join>:

int thread_join(tid_t tid) {
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 0c             	sub    $0xc,%esp
 9c9:	8b 75 08             	mov    0x8(%ebp),%esi
  if (tid < 0 || tid >= MAX_THREADS) return -1;
 9cc:	83 fe 07             	cmp    $0x7,%esi
 9cf:	77 6f                	ja     a40 <thread_join+0x80>

  while (thread_table[tid].state != ZOMBIE && thread_table[tid].state != UNUSED) {
 9d1:	89 f3                	mov    %esi,%ebx
 9d3:	c1 e3 04             	shl    $0x4,%ebx
 9d6:	81 c3 a0 0f 00 00    	add    $0xfa0,%ebx
 9dc:	8b 43 04             	mov    0x4(%ebx),%eax
 9df:	83 f8 03             	cmp    $0x3,%eax
 9e2:	75 19                	jne    9fd <thread_join+0x3d>
 9e4:	eb 1b                	jmp    a01 <thread_join+0x41>
 9e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
    thread_yield();
 9f0:	e8 eb fe ff ff       	call   8e0 <thread_yield>
  while (thread_table[tid].state != ZOMBIE && thread_table[tid].state != UNUSED) {
 9f5:	8b 43 04             	mov    0x4(%ebx),%eax
 9f8:	83 f8 03             	cmp    $0x3,%eax
 9fb:	74 04                	je     a01 <thread_join+0x41>
 9fd:	85 c0                	test   %eax,%eax
 9ff:	75 ef                	jne    9f0 <thread_join+0x30>
  if (thread_table[tid].state == ZOMBIE) {
    free(thread_table[tid].stack);
    thread_table[tid].state = UNUSED;
  }

  return 0;
 a01:	31 db                	xor    %ebx,%ebx
  if (thread_table[tid].state == ZOMBIE) {
 a03:	83 f8 03             	cmp    $0x3,%eax
 a06:	74 10                	je     a18 <thread_join+0x58>
 a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a0b:	89 d8                	mov    %ebx,%eax
 a0d:	5b                   	pop    %ebx
 a0e:	5e                   	pop    %esi
 a0f:	5f                   	pop    %edi
 a10:	5d                   	pop    %ebp
 a11:	c3                   	ret    
 a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(thread_table[tid].stack);
 a18:	c1 e6 04             	shl    $0x4,%esi
 a1b:	83 ec 0c             	sub    $0xc,%esp
 a1e:	ff b6 a0 0f 00 00    	pushl  0xfa0(%esi)
 a24:	e8 17 fc ff ff       	call   640 <free>
    thread_table[tid].state = UNUSED;
 a29:	83 c4 10             	add    $0x10,%esp
 a2c:	89 d8                	mov    %ebx,%eax
    thread_table[tid].state = UNUSED;
 a2e:	c7 86 a4 0f 00 00 00 	movl   $0x0,0xfa4(%esi)
 a35:	00 00 00 
 a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a3b:	5b                   	pop    %ebx
 a3c:	5e                   	pop    %esi
 a3d:	5f                   	pop    %edi
 a3e:	5d                   	pop    %ebp
 a3f:	c3                   	ret    
  if (tid < 0 || tid >= MAX_THREADS) return -1;
 a40:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 a45:	eb c1                	jmp    a08 <thread_join+0x48>
 a47:	66 90                	xchg   %ax,%ax
 a49:	66 90                	xchg   %ax,%ax
 a4b:	66 90                	xchg   %ax,%ax
 a4d:	66 90                	xchg   %ax,%ax
 a4f:	90                   	nop

00000a50 <mutex_init>:
#include "types.h"
#include "uthread.h"
#include "umutex.h"

void mutex_init(umutex_t *m) {
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
  m->locked = 0;
 a53:	8b 45 08             	mov    0x8(%ebp),%eax
 a56:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a5c:	5d                   	pop    %ebp
 a5d:	c3                   	ret    
 a5e:	66 90                	xchg   %ax,%ax

00000a60 <mutex_lock>:

void mutex_lock(umutex_t *m) {
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	53                   	push   %ebx
 a64:	83 ec 04             	sub    $0x4,%esp
 a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while (m->locked) {
 a6a:	8b 13                	mov    (%ebx),%edx
 a6c:	85 d2                	test   %edx,%edx
 a6e:	74 0b                	je     a7b <mutex_lock+0x1b>
    thread_yield();
 a70:	e8 6b fe ff ff       	call   8e0 <thread_yield>
  while (m->locked) {
 a75:	8b 03                	mov    (%ebx),%eax
 a77:	85 c0                	test   %eax,%eax
 a79:	75 f5                	jne    a70 <mutex_lock+0x10>
  }
  m->locked = 1;
 a7b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
 a81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a84:	c9                   	leave  
 a85:	c3                   	ret    
 a86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8d:	8d 76 00             	lea    0x0(%esi),%esi

00000a90 <mutex_unlock>:
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	8b 45 08             	mov    0x8(%ebp),%eax
 a96:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 a9c:	5d                   	pop    %ebp
 a9d:	c3                   	ret    

00000a9e <uswtch>:
# User-space context switch for xv6 x86
# void uswtch(struct context **old, struct context *new);
.globl uswtch
uswtch:
movl 4(%esp), %eax
 a9e:	8b 44 24 04          	mov    0x4(%esp),%eax
movl 8(%esp), %edx
 aa2:	8b 54 24 08          	mov    0x8(%esp),%edx
pushl %ebp
 aa6:	55                   	push   %ebp
pushl %ebx
 aa7:	53                   	push   %ebx
pushl %esi
 aa8:	56                   	push   %esi
pushl %edi
 aa9:	57                   	push   %edi
movl %esp, (%eax)
 aaa:	89 20                	mov    %esp,(%eax)
movl %edx, %esp
 aac:	89 d4                	mov    %edx,%esp
popl %edi
 aae:	5f                   	pop    %edi
popl %esi
 aaf:	5e                   	pop    %esi
popl %ebx
 ab0:	5b                   	pop    %ebx
popl %ebp
 ab1:	5d                   	pop    %ebp
ret
 ab2:	c3                   	ret    
