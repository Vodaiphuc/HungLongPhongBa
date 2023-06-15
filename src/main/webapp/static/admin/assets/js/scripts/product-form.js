$(function () {
    $("#price").ionRangeSlider({ min: 10, max: 1000, postfix: ' $' });

    $("#discount").ionRangeSlider({ min: 0, max: 100, postfix: ' %' });
});

let files = [],
    dragArea = document.querySelector('.drag-area'),
    input = document.querySelector('.drag-area input'),
    select = document.querySelector('.drag-area .select'),
    showImage = document.querySelector('.showImage');

/** CLICK LISTENER , from: 550 , from: 50*/
select.addEventListener('click', () => input.click());

/* INPUT CHANGE EVENT */
input.addEventListener('change', () => {
    let file = input.files;

    // if user select no image
    if (file.length == 0 || file.length > 4) return;

    for (let i = 0; i < file.length; i++) {
        if (file[i].type.split("/")[0] != 'image') continue;
        if (!files.some(e => e.name == file[i].name)) files.push(file[i])
    }

    showImages();
});

/** SHOW IMAGES */
function showImages() {
    showImage.innerHTML = files.reduce((prev, curr, index) => {
        return `${prev}
        <div class="col s12 m6 l4 xl2">
            <div>
                 <a class="btn-floating mb-1 waves-effect waves-light " onclick="delImage(${index})">
                 	<i class="material-icons">clear</i>
                  </a>
                  <img src="${URL.createObjectURL(curr)}" class="responsive-img mb-10" alt="">
            </div>
        </div>`
    }, '');
}

/* DELETE IMAGE 
            <div class="image">
                <span onclick="delImage(${index})">&times;</span>
                <img src="${URL.createObjectURL(curr)}" />
            </div>*/
function delImage(index) {
    files.splice(index, 1);
    showImages();
}

/* DRAG & DROP */
dragArea.addEventListener('dragover', e => {
    e.preventDefault()
    dragArea.classList.add('dragover')
})

/* DRAG LEAVE */
dragArea.addEventListener('dragleave', e => {
    e.preventDefault()
    dragArea.classList.remove('dragover')
});

/* DROP EVENT */
dragArea.addEventListener('drop', e => {
    e.preventDefault()
    dragArea.classList.remove('dragover');

    let file = e.dataTransfer.files;
    for (let i = 0; i < file.length; i++) {
        /** Check selected file is image */
        if (file[i].type.split("/")[0] != 'image') continue;

        if (!files.some(e => e.name == file[i].name)) files.push(file[i])
    }
    showImages();
});