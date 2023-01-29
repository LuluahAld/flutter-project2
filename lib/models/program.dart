class Program {
  var title;
  var milestones;
  var price;
  var img;

  Program(var title, var img, var price, var milestones) {
    this.title = title;
    this.img = img;

    this.price = price;
    this.milestones = milestones;
  }
}

List<Program> programs_added = [];
