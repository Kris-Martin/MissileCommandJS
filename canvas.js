export default class Canvas {
  width = 1280;
  height = 720;
  element;
  context;

  constructor() {
    this.element = document.createElement('canvas');
    this.element.width = this.width;
    this.element.height = this.height;
    this.context = this.element.getContext('2d');
    document.getElementById('game').appendChild(this.element);
  }
}
