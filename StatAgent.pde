public class StatAgent extends Agent {
    int cntC, cntD, cntTotal;

    public int getType() {
        return AgentType.Stat;
    }

    public void prepareForGame() {
        cntC = cntD = cntTotal = 0;
    }

    public int selectAction() {
        int act = 0;
        float r = random(cntTotal);
        if( r < cntC ) {
            act = AgentAction.C;
        } else {
            act = AgentAction.D;
        }
        return act;
    }

    public void notifyOpponentsAction(int act) {
        if( act == AgentAction.C ) {
            cntC++;
        } else {
            cntD++;
        }
        cntTotal++;
    }
}