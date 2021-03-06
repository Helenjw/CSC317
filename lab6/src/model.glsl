// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
//
// Inputs:
//   is_moon  whether we're considering the moon
//   time  seconds on animation clock
// Returns affine model transformation as 4x4 matrix
//
// expects: identity, rotate_about_y, translate, PI
mat4 model(bool is_moon, float time)
{
  mat4 res = identity();
  
  // Transform if it is a moon
  if (is_moon) {
    float theta = 0.5 * M_PI * time;
    res = transpose(translate(vec3( -2 * cos(theta), 0, 2 * sin(theta) ))); // Translate by total length of 2 in x and z direction
    res *= uniform_scale(0.3); // shrink planet by 70%
    res *= rotate_about_y(theta); // rotate around earth
  }

  // Otherwise we don't do anything
  return res;
}

