public class GridSpace {
    int spaceWidth, spaceHeight;
    ArrayList space;

    public GridSpace(int w, int h) {
        space = new ArrayList();
        spaceWidth = w;
        spaceHeight = h;
        for( int x = 0 ; x < spaceWidth ; x++ ) {
            for( int y = 0 ; y < spaceHeight ; y++ ) {
                space.add(new Cell(x, y));
            }
        }
        this.setupNeighbor();
    }

    private void setupNeighbor() {
        int[][] dxy = {
            {-1,-1}, { 0,-1}, { 1,-1},
            {-1, 0},          { 1, 0},
            {-1, 1}, { 0, 1}, { 1, 1}
        };

        for( int x = 0 ; x < spaceWidth ; x++ ) {
            for( int y = 0 ; y < spaceHeight ; y++ ) {
                Cell c = getCellAt(x, y);
                for( int i = 0 ; i < dxy.length ; i++ ) {
                    int xx = x + dxy[i][0];
                    int yy = y + dxy[i][1];
                    if( xx          <   0 ) { xx += spaceWidth;  }
                    if( spaceWidth  <= xx ) { xx -= spaceWidth;  }
                    if( yy          <   0 ) { yy += spaceHeight; }
                    if( spaceHeight <= yy ) { yy -= spaceHeight; }
                    c.addNeighbor(getCellAt(xx,yy));
                }
            }
        }
    }

    public ArrayList getEmptyCells() {
        ArrayList emptyCells = new ArrayList();
        for( int i = 0 ; i < space.size() ; i++ ) {
            Cell c = (Cell)space.get(i);
            if( c.getAgent() == null ) {
                emptyCells.add(c);
            }
        }
        return emptyCells;
    }

    public Cell getCellAt(int x, int y) {
        return (Cell)space.get(y * spaceWidth + x);
    }

    public int getWidth() {
        return spaceWidth;
    }

    public int getHeight() {
        return spaceHeight;
    }
}
