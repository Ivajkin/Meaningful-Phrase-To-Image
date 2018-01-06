PImage img1, img2, img3, img4;

void setup() {
  size(512, 512);
  // “The mystery of life isn't a problem to solve, but a reality to experience.” 
  img1 = meaningfulPhraseToImage("There is no real ending. It’s just the place where you stop the story.");
  img2 = meaningfulPhraseToImage("There is no real ending. It’s just the place where you stop.");
  img3 = meaningfulPhraseToImage("Deep in the human unconscious is a pervasive need for a logical universe that makes sense. But the real universe is always one step beyond logic.");
  img4 = meaningfulPhraseToImage("The mystery of life isn't a problem to solve, but a reality to experience.");

}
int charToChannel(char c) {
  return (int)((c - ' '))*255/('~'-' ');
}
PImage meaningfulPhraseToImage(String meaningfulPhrase) {
  PImage img;
  img = createImage(256, 256, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    // Должно быть как узор. Из центра наружу. Самоповторяющийся как фрактал.
    // Комплексные числа должны быть задействованы. Кватернионы для избыточности информации.
    float a = map(i, 0, img.pixels.length, 255, 0);
    if(meaningfulPhrase.charAt(i%meaningfulPhrase.length()) == ' ' || meaningfulPhrase.charAt(i%meaningfulPhrase.length()) == '.' ) {
    }
    int x = i%256-128;
    int y = i/256-128;
    int carret = (int)Math.round(Math.sqrt(x*x+y*y));
    img.pixels[i] = color(
                    charToChannel(meaningfulPhrase.charAt(carret%meaningfulPhrase.length())),
                   charToChannel(meaningfulPhrase.charAt((carret+1)%meaningfulPhrase.length())), 
                   charToChannel(meaningfulPhrase.charAt((carret+2)%meaningfulPhrase.length())), 255); 
  }
  return img; 
}

void draw() {
  background(0);
  image(img3, 0, 0, 512, 512);
}