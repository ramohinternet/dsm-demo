build process:

Build single image using the base containing php-fpm and apache (php-fpm-apache)

crete pod with two container with the same image but diffrent command running in forground

1st container with apache (with root user)[root] 
2nd container with php-fpm (with continua user)[non-root]


Pros:
- will have to deal with single image
- image transportation cost will reduce 
-- previously  (base + php-fpm) + drupal code and (base + apache) + drupal code
-- new    base + (php-fpm + apache ) + drupal code
- since only drupal code layer changes during every build will have to push and pull only that layer

Cons:-
- add command separatly to each container spec in the pod (should not be a problem)
