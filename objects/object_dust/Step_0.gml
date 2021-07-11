/// @description Animation

// Rotate cloud
image_angle += rotationSpeed;
y -= driftSpeed;

// Fade out
if (image_alpha > 0) {
    image_alpha -= fadeSpeed;
}

if (image_alpha <= 0) {
    instance_destroy();
}