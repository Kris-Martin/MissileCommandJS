export class Canvas {
  width = 1280;
  height = 720;
  canvas;
  context;

  constructor() {
    this.canvas = document.createElement('canvas');
    this.canvas.width = this.width;
    this.canvas.height = this.height;
    this.context = this.canvas.getContext('2d');
    document.getElementById('game').appendChild(this.canvas);
  }
}
