public class View {
    Model model;

    public View(Model m) {
        model = m;
    }

    private int getMaxPoint() {
        int max = model.getAgentAtIndex(0).getAveragePoint();
        for( int i = 1 ; i < model.getPopulationSize() ; i++ ) {
            int p = model.getAgentAtIndex(i).getAveragePoint();
            if( max < p ) {
                max = p;
            }
		}
        return max;
    }

    public void draw() {
        float xstep = (float)width  / model.getSpaceWidth();
        float ystep = (float)height / model.getSpaceHeight();
        int maxPoint = getMaxPoint();
        for( int i = 0 ; i < model.getPopulationSize() ; i++ ) {
            Agent agent = model.getAgentAtIndex(i);
            int x = agent.getLocation().getX();
            int y = agent.getLocation().getY();
            int d = min(255, 80 + (255 - 80) * (float)agent.getAveragePoint() / 3.0);

            stroke(0);
            switch(agent.getType()) {
            case AgentType.TFT:
                fill(0, 0, d);
                break;
            case AgentType.AllD:
                fill(d, 0, 0);
                break;
            case AgentType.Stat:
                fill(0, d, 0);
                break;
            }
            rect(x * xstep, y * ystep, xstep, ystep);
        }
/**
        int mx = int(mouseX / xstep);
        int my = int(mouseY / ystep);
        stroke(255);
        noFill();
        rect(mx * xstep, my * ystep, xstep, ystep);

        Agent a = model.getAgentAtPosition(mx, my);
        if( a != null ) {
            stroke(255);
            fill(255);
            text("(" + a.getAveragePoint() + ")", mx * xstep, my * ystep );
        }
**/
    }
}
