//LUCAS FUENTES
//Visualización interactiva de una base de datos

Table table;
int nSamples;
float[] mathScore;
float[] readingScore;
float[] writingScore;
String[] gender;

void setup() {
  size(1000, 1000);
  background(0);

  // Cargar los datos
  table = loadTable("StudentsPerformance.csv", "header");

  nSamples = table.getRowCount();

  // Inicializamos los arrays
  mathScore = new float[nSamples];
  readingScore = new float[nSamples];
  writingScore = new float[nSamples];
  gender = new String[nSamples];

  for (int i = 0; i < nSamples; i++) {
    mathScore[i] = table.getFloat(i, "math score");
    readingScore[i] = table.getFloat(i, "reading score");
    writingScore[i] = table.getFloat(i, "writing score");
    gender[i] = table.getString(i, "gender");
  }
}

void draw() {
  background(0);
  noStroke();
  textAlign(LEFT, TOP);
  fill(255);
  text("Math vs Reading Score | Color: Gender | Tamaño: Writing Score", 10, 10);

  for (int i = 0; i < nSamples; i++) {
    float x = map(mathScore[i], 0, 100, 50, width - 50);
    float y = map(readingScore[i], 0, 100, height - 50, 50);
    float radius = map(writingScore[i], 0, 100, 5, 25);

    if (gender[i].equals("male")) {
      fill(100, 150, 255, 180);
    } else {
      fill(255, 100, 150, 180);
    }

    ellipse(x, y, radius, radius);
  }
}
