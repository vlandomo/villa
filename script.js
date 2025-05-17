const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.getElementById('viewer').appendChild(renderer.domElement);

    // const controls = new THREE.OrbitControls(camera, renderer.domElement);
    const controls = new OrbitControls(camera, renderer.domElement);

    controls.enableDamping = true;

    const light = new THREE.HemisphereLight(0xffffff, 0x444444);
    light.position.set(0, 200, 0);
    scene.add(light);

    const loader = new THREE.GLTFLoader();
    loader.load('model/scene.gltf', function (gltf) {
      const model = gltf.scene;
      model.scale.set(1, 1, 1); // عدل الحجم إذا لزم
      scene.add(model);
    }, undefined, function (error) {
      console.error('حدث خطأ أثناء تحميل النموذج:', error);
    });

    camera.position.set(0, 2, 5);

    function animate() {
      requestAnimationFrame(animate);
      controls.update();
      renderer.render(scene, camera);
    }

    animate();

    window.addEventListener('resize', () => {
      camera.aspect = window.innerWidth/window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    });