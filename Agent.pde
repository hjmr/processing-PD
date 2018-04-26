abstract public class Agent {
    int point;
    int count;
    Cell location;

    float moveRatio = 0.1;

    public Agent() {
        point = 0;
        count = 0;
    }

    public void setLocation(Cell c) {
        location = c;
    }

    public Cell getLocation() {
        return location;
    }

    public void update() {
        if( location != null ) {
            ArrayList neighborAgents = location.getNeighborAgents();
            if( 0 < neighborAgents.size() ) {
                for( int i = 0 ; i < neighborAgents.size() ; i++ ) {
                    Agent opp = (Agent)neighborAgents.get(i);
                    Game.play(this, opp);
                }
            } else {
                int p = (int)(random(location.getNeighborSize()));
                Cell c = location.getNeighborAtIndex(p);
                if( c.getAgent() == null ) {
                    moveTo(c);
                }
            }
        }
    }

    private void moveTo(Cell c) {
        location.setAgent(null);
        location = c;
        location.setAgent(this);
    }

    public void addPoint(int p) {
        point += p;
        count++;
    }

    public float getAveragePoint() {
        p = 0.0;
        if( 0 < count ) {
            p = (float)point / count;
        }
        return p;
    }

    abstract public int getType();
    abstract public void prepareForGame();
    abstract public int selectAction();
    abstract public void notifyOpponentsAction(int act);
}