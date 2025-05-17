<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>مشروعي المعماري</title>
    <style>
      * {
        font-family: "Cairo", sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      :root {
        --title_clr: #333;
        --background_clr: #f5f5f5;
      }
      body {
        background-color: var(--background_clr);
        color: var(--title_clr);
      }
      #viewer {
        width: 100vw;
        height: 100vh;
      }
      header {
        background-color: #2c3e50;
        color: white;
        padding: 20px;
        text-align: center;
      }

      .container {
        padding: 20px;
        max-width: 900px;
        margin: auto;
      }

      .project-title {
        font-size: 24px;
        margin-bottom: 10px;
      }

      .project-description {
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 20px;
      }

      .gallery {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
        gap: 10px;
        margin-bottom: 30px;
      }

      .gallery img {
        width: 100%;
        height: auto;
        border-radius: 8px;
      }

      .videos {
        display: flex;
        flex-direction: column;
        gap: 20px;
      }

      .videos video {
        width: 100%;
        border-radius: 8px;
      }

      @media (max-width: 600px) {
        .project-title {
          font-size: 20px;
        }

        .project-description {
          font-size: 16px;
        }
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Villa Musiqar</h1>
    </header>

    <div class="container">
      <div class="project-title">Project Info</div>
      <div class="project-description">
        <p>
          This project aims to design a modern architectural space that combines
          function and beauty.
        </p>
      </div>

      <div class="gallery">
        <img src="media/i1.png" />
        <img src="media/i2.png" />
        <img src="media/i3.png" />
        <img src="media/i4.png" />
        <img src="media/i5.png" />
        <img src="media/i6.png" />
        <img src="media/i7.png" />
        <img src="media/i8.png" />
        <img src="media/i9.png" />
        <img src="media/i10.png" />
        <img src="media/i11.png" />
        <img src="media/i12.png" />
        <img src="media/i13.png" />
        <img src="media/i14.png" />
        <img src="media/i15.png" />
        <img src="media/i16.png" />
        <img src="media/i17.png" />
        <img src="media/i18.png" />
      </div>

      <div class="videos">
        <video controls>
          <source src="media/v1.mp4" type="video/mp4" />
          المتصفح لا يدعم تشغيل الفيديو.
        </video>
        <video controls>
          <source src="media/v2.mp4" type="video/mp4" />
          المتصفح لا يدعم تشغيل الفيديو.
        </video>
      </div>
    </div>
    <div id="viewer"></div>

    <!-- Three.js الأساسية -->
    <script src="https://cdn.jsdelivr.net/npm/three@0.158.0/build/three.min.js"></script>

    <!-- محمل GLTF -->
    <script src="https://cdn.jsdelivr.net/npm/three@0.158.0/examples/js/loaders/GLTFLoader.js"></script>

    <!-- أدوات التحكم OrbitControls -->
    <script src="https://cdn.jsdelivr.net/npm/three@0.158.0/examples/js/controls/OrbitControls.js"></script>

    <script>
      const scene = new THREE.Scene();
      const camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
      );
      const renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.setSize(window.innerWidth, window.innerHeight);
      document.getElementById("viewer").appendChild(renderer.domElement);

      const controls = new OrbitControls(camera, renderer.domElement); // ← تصحيح هنا
      controls.enableDamping = true;

      const light = new THREE.HemisphereLight(0xffffff, 0x444444);
      light.position.set(0, 200, 0);
      scene.add(light);

      const loader = new THREE.GLTFLoader();
      loader.load(
        "model/scene.gltf",
        function (gltf) {
          const model = gltf.scene;
          model.scale.set(1, 1, 1);
          scene.add(model);
        },
        undefined,
        function (error) {
          console.error("خطأ أثناء تحميل النموذج:", error);
        }
      );

      camera.position.set(0, 2, 5);

      function animate() {
        requestAnimationFrame(animate);
        controls.update();
        renderer.render(scene, camera);
      }

      animate();

      window.addEventListener("resize", () => {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
      });
    </script>
  </body>
</html>
