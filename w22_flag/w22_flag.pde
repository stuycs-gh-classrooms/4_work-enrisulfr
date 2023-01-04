size(400, 300);

// Draw the flag background
background(#f5b8c5);  // Blue

// Draw the white cross
noStroke();
fill(255);
rect(0, 50, 400, 50);  // Top
rect(50, 0, 50, 300);  // Left
rect(300, 0, 50, 300);  // Right
rect(0, 200, 400, 50);  // Bottom

// head
fill(#fcdaa9);
ellipse(200, 150, 150, 150);
//beard
fill(#c2b093);
arc(200, 160, 150, 130, 0, PI);
//glasses
fill(#473e31);
arc(200-75/2, 130, 75, 50, 0, PI);
arc(200+75/2, 130, 75, 50, 0, PI);
//wips
fill(#ff87bb);
ellipse(200, 190, 50, 30);
noFill();
strokeWeight(6);
stroke(#eb659f);

//jacket
fill(0);
noStroke();
ellipse(200, 300, 200, 150);

//text
textSize(30);
text("Try hair", 130, 70);
