import java.text.DecimalFormat;

class P5M_RuntimeMonitor {
  
  Boolean hide = true;
  Boolean keyCatched = false;

  P5M_RuntimeMonitor() {
  }


  void show() {
    if (keyPressed && keyCatched == false) {
      if (key == TAB) {
        hide =! hide;
        keyCatched = true;
      }
    } else if (!keyPressed) {
      keyCatched = false;
    }

    if (!hide) {

      int line_break = 11;
      int frame_rate = int(frameRate);
      long max_memory = Runtime.getRuntime().maxMemory();
      long free_memory = Runtime.getRuntime().freeMemory();
      long available_processors = Runtime.getRuntime().availableProcessors();
      String java_version = Runtime.class.getPackage().getSpecificationVersion();
      
      pushStyle();
      textSize(line_break);
      colorMode(RGB);
      //Background
      fill(0, 100);
      noStroke();
      rect(0, 0, 210, 90);
      // FPS
      fill(255);
      text(frame_rate+"FPS", 5, line_break*1.3);
      // RAM RECT
      fill(0, 255, 0);
      rect(5, line_break*2, 200, line_break*0.5);
      fill(255, 0, 0);
      rect(5, line_break*2, map(free_memory, 0, max_memory, 0, 100), line_break*0.5);
      // MORE DATA
      fill(255);
      text("FREE MEMORY: "+ readableFileSize(free_memory), 5, line_break*4);
      text("MAX MEMORY: "+ readableFileSize(max_memory), 5, line_break*5);
      text("AVAILABLE PROCESSORS: "+ available_processors, 5, line_break*6);
      text("JAVA VERSION: "+ java_version, 5, line_break*7);

      popStyle();
    }
  }

  String readableFileSize(long size) {
    if (size <= 0) return "0";
    final String[] units = new String[] { 
      "B", "kB", "MB", "GB", "TB"
    };
    int digitGroups = (int) (Math.log10(size)/Math.log10(1024));
    return new DecimalFormat("#,##0.#").format(size/Math.pow(1024, digitGroups)) + " " + units[digitGroups];
  }
}
