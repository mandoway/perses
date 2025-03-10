


typedef unsigned long int st;
typedef unsigned long long dt;
typedef union
{
  dt d;
  struct
  {
    st h, l;
  }
  s;
} t_be;

typedef union
{
  dt d;
  struct
  {
    st l, h;
  }
  s;
} t_le;
int f_le (t_le afh, t_le bfh) { t_le hh; t_le hp, lp, dp, m; st ad, bd; int s; s = 0; ad = afh.s.h - afh.s.l; bd = bfh.s.l - bfh.s.h; if (bd > bfh.s.l) { bd = -bd; s = ~s; } lp.d = (dt) afh.s.l * bfh.s.l; hp.d = (dt) afh.s.h * bfh.s.h; dp.d = (dt) ad *bd; dp.d ^= s; hh.d = hp.d + hp.s.h + lp.s.h + dp.s.h; m.d = (dt) lp.s.h + hp.s.l + lp.s.l + dp.s.l; return hh.s.l + m.s.l; }
int f_be (t_be afh, t_be bfh) { t_be hh; t_be hp, lp, dp, m; st ad, bd; int s; s = 0; ad = afh.s.h - afh.s.l; bd = bfh.s.l - bfh.s.h; if (bd > bfh.s.l) { bd = -bd; s = ~s; } lp.d = (dt) afh.s.l * bfh.s.l; hp.d = (dt) afh.s.h * bfh.s.h; dp.d = (dt) ad *bd; dp.d ^= s; hh.d = hp.d + hp.s.h + lp.s.h + dp.s.h; m.d = (dt) lp.s.h + hp.s.l + lp.s.l + dp.s.l; return hh.s.l + m.s.l; }

void abort (void);
void exit (int);
int
main ()
{
  t_be x;
  x.s.h = 0x10000000U;
  x.s.l = 0xe0000000U;
  if (x.d == 0x10000000e0000000ULL
      && f_be ((t_be) 0x100000000ULL, (t_be) 0x100000000ULL) != -1)
    abort ();
  if (x.d == 0xe000000010000000ULL
      && f_le ((t_le) 0x100000000ULL, (t_le) 0x100000000ULL) != -1)
    abort ();
  exit (0);
}
