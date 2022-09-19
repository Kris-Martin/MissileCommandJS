export default class Canvas {
  defaultWidth = 1280;
  defaultHeight = 720;
  width;
  height;
  element;
  context;

  constructor() {
    this.element = document.getElementsByTagName('canvas')[0];
    console.log(this.element.clientWidth, this.element.clientHeight);
    console.log(
      (this.element.clientWidth / this.defaultWidth) * this.defaultHeight,
    );
    this.height =
      (this.element.clientWidth / this.defaultWidth) * this.defaultHeight;
    this.width = this.element.clientWidth;
    this.element.width = this.width;
    this.element.height = this.height;
    this.context = this.element.getContext('2d');
  }

  update(canvasWidth, canvasHeight) {
    this.width = canvasWidth;
    this.height = canvasHeight;
  }
}
