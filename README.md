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
 - The program "shoots" countless rays at the speed of light from the observer's point of view. These rays travel through the simulated space toward a black hole and its surrounding accretion disk.
 - Each ray is recalculated after each movement, based on where and at what angle it is to the black hole.
 - Each ray eventually "lands" on something.

#### The Black Hole:
Rays that fall into the black hole’s event horizon are lost forever and return no color, representing the absolute darkness at the center.
#### The Accretion Disk: 
Rays hitting the glowing, swirling matter around the black hole return a specific color based on where they land. The accretion disk emits light due to the intense heat from friction and gravitational energy.
#### Background Light: 
Rays passing near the black hole without directly hitting it may capture light bent from objects behind it, creating the warped appearance of the surrounding space.
Generating the Visual
#### Color Assignment: 
The color of each ray is determined based on where it interacts. For example:

- Rays landing on the black hole's shadow (event horizon) are black.
- Rays hitting the accretion disk return colors based on the disk’s properties (temperature, material composition, or light frequency).
- Rays bending around the black hole return colors from distorted background stars or the accretion disk, contributing to the halo-like ring.

#### Rendering the Scene: 
Once all rays are traced, the colors they return are mapped to a 2D image, representing the observer’s view of the black hole. This produces the familiar appearance of:

- A dark central shadow (the event horizon).
- A glowing ring around it (the accretion disk), warped by gravitational lensing.

Image.

## Code in GameMaker

The provided code is divided into three parts: `CreateEvent.gml`, `StepEvent.gml`, and `DrawEvent.gml`. Each of these handles specific aspects of the simulation.
The `DestroyEvent.gml` is responsible for cleaning up the drawSurface (used for rendering the simulation) if it exists, in order to release memory.

### **1. CreateEvent.gml**
This script initializes the variables, sets up the environment, and prepares the raycasts and stars.

#### Key Components:
- **Scene Setup:**
  - The black hole is positioned at the center with a specific radius (`blackholeradius`), surrounded by an accretion disk with defined inner and outer radii.
  - A 3D-like space is defined using `windowWidth`, `windowHeight`, and `windowDepth`.

- **Raycasts Initialization:**
  - Depending on the perspective (`orthogonal` or perspective view), rays are generated.
  - In **perspective mode**, rays originate from the center and point outward, mimicking an observer's view.

- **Stars:**
  - A number of stars (`staramount`) are randomly distributed in the background for aesthetic and simulation purposes.

---

### **2. StepEvent.gml**
This script computes how the rays interact with the black hole and its accretion disk.

#### Key Components:
- **Ray Propagation:**
  - Each ray moves forward based on its direction vector.
  - If a ray comes close to the black hole, it is influenced by gravitational forces. The gravitational pull is calculated as:
    $$\[
    F = \frac{\text{grav}}{\text{distance to black hole}}
    \]$$

    The force components (`fx`, `fy`, `fz`) alter the ray's direction.

- **Collision Detection:**
  - Rays are checked for:
    1. **Collision with the black hole** (inside the event horizon).
    2. **Collision with the accretion disk** (within its boundaries).
    3. **Exceeding a predefined limit in the scene.**

- **Color Assignment:**
  - Rays hitting:
    - **Black Hole:** Assigned `blackholeColor` (pure black).
    - **Accretion Disk:** Assigned `innerDiscColor` or `outerDiscColor` depending on proximity to the disk's edge.
  - The `raycastsToDraw` array records the position and color of rays that are ready to be rendered.

- **Ray Movement:**
  - Rays that haven't finished their journey continue moving based on their normalized direction vectors.

---

### **3. DrawEvent.gml**
This script renders the scene onto the screen, displaying the black hole, accretion disk, and stars.

#### Key Components:
- **Drawing Stars:**
  - Stars are drawn as points using the `starColor`.

- **Rendering Rays:**
  - Each completed ray in `raycastsToDraw` is rendered as a pixel (or block) on the screen, with the color determined by where it landed (black hole, accretion disk, or background).

- **Surface for Optimization:**
  - A drawing surface is used to efficiently render the simulation frame by frame.

---

### **How It Works:**
1. **Simulation Space:** Rays are initialized in a 3D space and assigned directions depending on the perspective.
2. **Gravitational Bending:** As rays approach the black hole, their paths bend due to gravitational forces.
3. **Collision and Coloring:**
   - Rays that fall into the event horizon are marked as black.
   - Rays hitting the accretion disk are colored based on their position.
   - Rays that don't collide are left uncolored.
4. **Rendering:**
   - The processed ray data (`raycastsToDraw`) is used to draw the final image on the screen.

---

This implementation provides a simplified but effective simulation of a black hole and its visual phenomena using raycasting techniques in a 3D-like environment.
