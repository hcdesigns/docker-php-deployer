# Docker with PHP deployer

Based on Alpine Linux and includes composer. Available for PHP 7.1, 7.2, 7.3 and 7.4.

Adds default user due to deploy error: "No user exists for uid 1000"

More info: https://deployer.org/

# Update images
1. Update the dockerfile
2. Build the image (tag it as hcdesigns/php-deployer:{php version})
2.5 Make sure you are logged into docker (`docker login`)
3. `docker push hcdesigns/php-deployer:{php version}` 