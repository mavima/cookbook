const preview = () => {
  const photoInput = document.getElementById('upload-img');
  const photoPreview = document.getElementById('img-preview');
  if (photoInput) {photoInput.addEventListener('change', () => {
    const fReader = new FileReader();
    fReader.readAsDataURL(photoInput.files[0]);
    fReader.addEventListener('loadend', (event) => {
      photoPreview.classList.add('visible')
      photoPreview.style.backgroundImage = `url("${event.target.result}")`;
    });
  });
  };
};
export { preview }
