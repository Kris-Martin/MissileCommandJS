export default class Canvas {
  defaultWidth = 1280;
  defaultHeight = 720;
  width;
  height;
  element;
  context;

  constructor() {
    this.element = document.getElementsByTagName('canvas')[0];
    this.width = this.element.clientWidth;
    this.height =
      (this.element.clientWidth / this.defaultWidth) * this.defaultHeight;
    this.element.width = this.width;
    this.element.height = this.height;
    this.context = this.element.getContext('2d');
  }

  update(ctx, canvasWidth, canvasHeight) {
    this.width = canvasWidth;
    this.height = canvasHeight;
    ctx.scale(this.width, this.height);
  }
}
