/// @description Destroy surface
// Cleanup surface
if (surface_exists(drawSurface)) {
    surface_free(drawSurface);
}
