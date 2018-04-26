public class Model {
	private GridSpace space;
	private Population pop;

	public Model(GridSpace s, Population p) {
		space = s;
		pop   = p;
	}
	
	public void randomizeSpace() {
		for( int i = 0 ; i < pop.getSize() ; i++ ) {
            Agent a = pop.getAgentAtIndex(i);
			boolean set = false;
			while( !set ) {
				int x = (int)(random(space.getWidth() ));
			    int y = (int)(random(space.getHeight()));
				Cell c = space.getCellAt(x, y);
				if( c.getAgent() == null ) {
					c.setAgent(a);
					a.setLocation(c);
					set = true;
				}
			}
		}
	}
	
	public void update() {
		pop.update();
        for( int i = 0 ; i < int(pop.getSize() * 0.01) ; i++ ) {
            removeOneAgent();
            addOneAgent();
        }
	}

    private void removeOneAgent() {
        int x = (int)(random(space.getWidth() ));
        int y = (int)(random(space.getHeight()));
        Cell c = space.getCellAt(x, y);
       if( c.getAgent() != null ) {
            pop.removeAgent(c.getAgent());
        }
    }

    private Agent getWinnerAgent(ArrayList agents) {
        Agent winner = null;
        int sum = 0;
        for( int i = 0 ; i < agents.size() ; i++ ) {
            Agent a = (Agent)agents.get(i);
            sum += a.getAveragePoint();
        }
        float r = random(sum);
        for( int i = 0 ; i < agents.size() ; i++ ) {
            Agent a = (Agent)agents.get(i);
            if( r < a.getAveragePoint() ) {
                winner = a;
                break;
            }
            r -= a.getAveragePoint();
        }
        return winner;
    }

    private void addOneAgent() {
        ArrayList emptyCells = space.getEmptyCells();
        if( 0 < emptyCells.size() ) {
            Cell c = (Cell)emptyCells.get(int(random(emptyCells.size())));
            ArrayList neighborAgents = c.getNeighborAgents();
            Agent winner = getWinnerAgent(neighborAgents);
            Agent newOne = null;
            if( winner != null ) {
                switch(winner.getType()) {
                case AgentType.TFT:
                    newOne = new TFTAgent();
                    break;
                case AgentType.AllD:
                    newOne = new AllDAgent();
                    break;
                case AgentType.Stat:
                    newOne = new StatAgent();
                    break;
                }
            } else {
                switch(int(random(3))) {
                case AgentType.TFT:
                    newOne = new TFTAgent();
                    break;
                case AgentType.AllD:
                    newOne = new AllDAgent();
                    break;
                case AgentType.Stat:
                    newOne = new StatAgent();
                    break;
                }
            }
            if( newOne != null ) {
                pop.addAgent(newOne);
                c.setAgent(newOne);
                newOne.setLocation(c);
            }
        }
    }
	
	public int getSpaceWidth() {
		return space.getWidth();
	}
	
	public int getSpaceHeight() {
		return space.getHeight();
	}
	
	public Agent getAgentAtPosition(int x, int y) {
		return space.getCellAt(x, y).getAgent();
	}

    public int getPopulationSize() {
        return pop.getSize();
    }

    public Agent getAgentAtIndex(int i) {
        return pop.getAgentAtIndex(i);
    }
}
