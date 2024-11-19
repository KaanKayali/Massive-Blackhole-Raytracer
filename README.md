# Massive-Blackhole-Raytracer

## Blackholes in space
Black holes typically form from the remnants of massive stars. When a star exhausts its nuclear fuel, its core can no longer support the gravitational force, causing it to collapse. If the core's mass is sufficient, this collapse continues indefinitely, forming a singularity—a point of infinite density—at the black hole's center.

Image. Image.

## Structure of a Black Hole
Singularity: The core of the black hole, where matter is compressed into an infinitely small space. The laws of physics as we know them break down here.
Event Horizon: The "point of no return." Anything crossing this boundary is inevitably pulled into the singularity. This is the black hole's effective "surface."
Accretion Disk: Matter spiraling toward the black hole forms a disk due to its angular momentum. Friction in this disk heats the matter, making it emit radiation visible to observers.

## How They Appear
To an observer, black holes are invisible because light cannot escape them. However, their presence is often inferred through their gravitational effects on nearby objects, such as stars, or through the radiation emitted by their accretion disks. They also produce phenomena like gravitational lensing, bending light from background objects.

When light passes near a black hole, it doesn’t travel in a straight line due to the intense gravitational field created by the black hole's immense mass. According to Einstein's general relativity, gravity warps spacetime itself. This means that light, which normally travels in straight lines, follows curved paths around the black hole. This bending of light is called gravitational lensing.

Image.

The disk around the black hole appears bent because the black hole's gravity is so strong that it bends the paths of light traveling near it. This bending allows us to see parts of the disk that would normally be hidden, like the far side and bottom. Light from behind the black hole curves around to reach the observer, making the disk look like a glowing ring that wraps around the black hole. This distortion is caused by the warping of space around the black hole, a phenomenon called gravitational lensing.

## Generating an image of a blackhole

### The Raycasting Mechanism
Shooting Rays: The program "shoots" countless rays at the speed of light from the observer's point of view. These rays travel through the simulated space toward a black hole and its surrounding accretion disk.

Interaction with the Black Hole: As the rays travel, they are influenced by the immense gravitational pull of the black hole, which bends their paths. This bending of light, known as gravitational lensing, is a fundamental effect of the black hole's warped spacetime.

Collision Detection: Each ray eventually "lands" on something:

The Black Hole: Rays that fall into the black hole’s event horizon are lost forever and return no color, representing the absolute darkness at the center.
The Accretion Disk: Rays hitting the glowing, swirling matter around the black hole return a specific color based on where they land. The accretion disk emits light due to the intense heat from friction and gravitational energy.
Background Light: Rays passing near the black hole without directly hitting it may capture light bent from objects behind it, creating the warped appearance of the surrounding space.
Generating the Visual
Color Assignment: The color of each ray is determined based on where it interacts. For example:

Rays landing on the black hole's shadow (event horizon) are black.
Rays hitting the accretion disk return colors based on the disk’s properties (temperature, material composition, or light frequency).
Rays bending around the black hole return colors from distorted background stars or the accretion disk, contributing to the halo-like ring.
Rendering the Scene: Once all rays are traced, the colors they return are mapped to a 2D image, representing the observer’s view of the black hole. This produces the familiar appearance of:

A dark central shadow (the event horizon).
A glowing ring around it (the accretion disk), warped by gravitational lensing.
Additional distortions showing light from the background or other features.
Why This Works
The simulation works because of how light behaves near a black hole:

Gravitational Lensing: The black hole’s gravity bends the path of light, causing objects behind it to appear distorted or duplicated.
Relativistic Effects: The light from the accretion disk changes in color and brightness due to the extreme speeds of the orbiting material and the black hole's gravity.
Observing the Black Hole
This simulation enables us to "see" a black hole, which is otherwise invisible. By tracing how light interacts with the black hole's surroundings, the program recreates its visual signature, including the strikingly warped space and glowing disk.
