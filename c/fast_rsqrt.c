#include <math.h>

float q_rsqrt(float number)
{
  long i;
  float x2, y;
  const float threehalfs = 1.5F;

  x2 = number * 0.5F;
  y  = number;
  i  = * ( long * ) &y;                       // evil floating point bit level hacking
  i  = 0x5f3759df - ( i >> 1 );               // what the fuck?
  y  = * ( float * ) &i;
  y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
  // y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed

  return y;
}

float q_rsqrt_2(float number)
{
  long i;
  float x2, y;
  const float threehalfs = 1.5F;

  x2 = number * 0.5F;
  y  = number;
  i  = * ( long * ) &y;                       // evil floating point bit level hacking
  i  = 0x5f3759df - ( i >> 1 );               // what the fuck?
  y  = * ( float * ) &i;
  y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
  y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed

  return y;
}

float inverse_sqrt(float number) {
  return 1 / sqrt(number);
}

int main(int argc, char const *argv[])
{
  int size = 4;
  float inputs[] = {0.4332111f,343432.0f,35.432211123f,33.2f};
  for (int i = 0 ; i < size ; i++) {
    q_rsqrt(inputs[i]);
    q_rsqrt_2(inputs[i]);
    inverse_sqrt(inputs[i]);
  }
  return 0;
}
