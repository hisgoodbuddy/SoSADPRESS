function test_suite = test_coremethods
%test_coremethods  Unit tests for opSpot's core methods
initTestSuite;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dat = setup
   rng('default');
   A  = randn(2,2) + 1i*randn(2,2);
   B  = opMatrix(A);
   c  = randn(1,1) + 1i*randn(1,1);
   xr =    randn(2,2);
   xi = 1i*randn(2,2);
   dat.A  = A * c;
   dat.B  = B * c;
   dat.x  = xr + xi;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_operator_sums(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   C = A' * 5 * A;
   D = B' * 5 * B;
   assertElementsAlmostEqual( ...
       (A + 5) * x         ,...
       (B + 5) * x         );
   assertElementsAlmostEqual( ...
       (A - 5) * x         ,...
       (B - 5) * x         );
   assertElementsAlmostEqual( ...
       (5 + A) * x         ,...
       (5 + B) * x         );
   assertElementsAlmostEqual( ...
       (5 + (-A)) * x     ,...
       (5 + (-B)) * x      );
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_operator_products(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   C = A' * 5 * A;
   D = B' * 5 * B;
   assertElementsAlmostEqual( ...
       ((5*A*C)' * A) * x    ,...
       ((5*B*D)' * B) * x     );
   assertElementsAlmostEqual( ...
       ((5*A*C)' * A) * xr'  ,...
       ((5*B*D)' * B) * xr'   );
   assertElementsAlmostEqual( ...
       ((5*A*C)' * A) * xi'  ,...
       ((5*B*D)' * B) * xi'   );
   assertElementsAlmostEqual( ...
       (5*A*C*A) * x         ,...
       (5*B*D*B) * x          );
   assertElementsAlmostEqual( ...
       (5*A*C*A) * xr        ,...
       (5*B*D*B) * xr         );
   assertElementsAlmostEqual( ...
       (5*A*C*A) * xi        ,...
       (5*B*D*B) * xi         );
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_opMatrix(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   assertElementsAlmostEqual(...
      A * x,...
      B * x);
   assertElementsAlmostEqual(...
      A * xr,...
      B * xr);
   assertElementsAlmostEqual(...
      A * xi,...
      B * xi);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_transpose(dat) % .' dot-transpose
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   assertElementsAlmostEqual(A.' * x,...
                             B.' * x);
   assertElementsAlmostEqual(A.' * xr,...
                             B.' * xr);
   assertElementsAlmostEqual(A.' * xi,...
                             B.' * xi);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_ctranspose(dat) % ' regular transpose
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   assertElementsAlmostEqual( ...
      A' * x'  ,...
      B' * x'  );
   assertElementsAlmostEqual( ...
      A' * xr'  ,...
      B' * xr'  );
   assertElementsAlmostEqual( ...
      A' * xi'  ,...
      B' * xi'  );
   assertElementsAlmostEqual( ...
      B'' * x   ,...
      B   * x   );
   assertElementsAlmostEqual( ...
      (x'*B')' ,...
      B* x   );   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_real(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   assertElementsAlmostEqual( ...
       real(A)*x   ,...
       real(B)*x   );
   assertElementsAlmostEqual( ...
       real(A)*xr  ,...
       real(B)*xr  );
   assertElementsAlmostEqual( ...
       real(A)*xi  ,...
       real(B)*xi  );
   assertElementsAlmostEqual( ...
       real(A)'*x  ,...
       real(B)'*x  );
   assertElementsAlmostEqual( ...
       real(A)'*xr  ,...
       real(B)'*xr  );
   assertElementsAlmostEqual( ...
       real(A)'*xi  ,...
       real(B)'*xi  );
   assertElementsAlmostEqual( ...
       real(A')*x  ,...
       real(B')*x  );
   assertElementsAlmostEqual( ...
       real(A')*xr  ,...
       real(B')*xr  );
   assertElementsAlmostEqual( ...
       real(A')*xi  ,...
       real(B')*xi  );
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_image(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   assertElementsAlmostEqual(imag(A)*x,...
                             imag(B)*x);
   assertElementsAlmostEqual(imag(A)*xr,...
                             imag(B)*xr);
   assertElementsAlmostEqual(imag(A)*xi,...
                             imag(B)*xi);
   assertElementsAlmostEqual(imag(A)'*x,...
                             imag(B)'*x);
   assertElementsAlmostEqual(imag(A)'*xr,...
                             imag(B)'*xr);
   assertElementsAlmostEqual(imag(A)'*xi,...
                             imag(B)'*xi);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_conj(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   c = 1i*randn;
   assertElementsAlmostEqual(conj(A)*x,...
                             conj(B)*x);
   assertElementsAlmostEqual(conj(A)*xr,...
                             conj(B)*xr);
   assertElementsAlmostEqual(conj(A)*xi,...
                             conj(B)*xi);
   assertElementsAlmostEqual(conj(A)'*x,...
                             conj(B)'*x);
   assertElementsAlmostEqual(conj(A)'*xr,...
                             conj(B)'*xr);
   assertElementsAlmostEqual(conj(A)'*xi,...
                             conj(B)'*xi);
   assertElementsAlmostEqual(conj(c*conj(A)'),double(conj(c*conj(B)')));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_pow(dat)
   A = dat.A; B = dat.B; x = dat.x; xr = real(x); xi = imag(x);
   c = randn(1,1) + sqrt(-1) * randn(1,1);
   assertElementsAlmostEqual(...
      (A^3) * x,...
      (B^3) * x);
   assertElementsAlmostEqual(...
      double(((c*B^3)')^2),...
             ((c*A^3)')^2);
   assertElementsAlmostEqual(...
      double((c*B^3)^2),...
             (c*A^3)^2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_inv(dat)
   A = dat.A; B = dat.B; x = dat.x;
   c = randn(1,1) + sqrt(-1) * randn(1,1);
   assertElementsAlmostEqual(...
      inv(A) * x,...
      inv(B) * x);
   assertElementsAlmostEqual(...
      double(inv(B)),...
      inv(A));
   assertElementsAlmostEqual(...
      double(inv(inv(B*c))),A*c);
   assertElementsAlmostEqual(...
      double(inv(inv(B*c)')),(A*c)');
   assertElementsAlmostEqual(...
      double(inv(c*inv(B))),...
      A/c);
   assertElementsAlmostEqual(...
      double(inv(c*inv(B)')),...
      A'/c);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_inv_pow(dat)
   c = randn(1,1) + 1i * randn(1,1);
   A = randn(3,3) + 1i * randn(3,3);
   x = randn(3,1) + 1i * randn(3,1);
   B = opMatrix(A);
   assertElementsAlmostEqual(...
      (A^-3) * x,...
      (B^-3) * x);
   assertElementsAlmostEqual(...
      double(inv(c*B)^-2),...
             inv(c*A)^-2);
   assertElementsAlmostEqual(...
      double(inv(c*B')^-2),...
             inv(c*A')^-2);
   assertElementsAlmostEqual(...
      double(inv(c*B^2)^-2),...
             inv(c*A^2)^-2);
   assertElementsAlmostEqual(...
      double((inv(c*B^2)')^-2),...
             (inv(c*A^2)')^-2);
   assertElementsAlmostEqual(...
      double(inv(c*B)^-2),...
             inv(c*A)^-2)
   assertElementsAlmostEqual(...
      double((inv(c*B)')^-2),...
             (inv(c*A)')^-2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function test_coremethods_simplification(dat)
   A = dat.A; B = dat.B;
   assertEqual(char(B),...
               char((B')'));
   assertEqual(char(B),...
               char((B.').'));
   assertEqual(char(B),...
               char(conj(conj(B))));

   assertEqual(char((B').'),...
               char(conj(B)));
   assertEqual(char(conj(B')),...
               char(B.'));
   assertEqual(char(conj(B.')),...
               char(B'));
   assertEqual(char(conj(B).'),...
               char(B'));
   assertEqual(char(conj(B)'),...
               char(B.'));
end
