boolean running = false;
Model model = null;
View view = null;

void setup() {
    size(window.innerWidth, window.innerHeight);
    frameRate(20);
    background(0);

    model = new Model(new GridSpace(50, 50), new Population(700, 700, 700));
    model.randomizeSpace();
    view = new View(model);
}

void draw() {
    fadeToBlack();
    if( running == true ) {
        model.update();
    }
    view.draw();
}

void fadeToBlack() {
    noStroke();
    fill(0, 70);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

void mousePressed() {
    running = (running == true) ? false : true;
}
