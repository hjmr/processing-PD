public class Population {
	ArrayList pop;
	
	public Population(int tftNum, int alldNum, int statNum) {
		pop = new ArrayList();
		for( int i = 0 ; i < tftNum ; i++ ) {
			pop.add(new TFTAgent());
		}

		for( int i = 0 ; i < alldNum ; i++ ) {
			pop.add(new AllDAgent());
		}

		for( int i = 0 ; i < statNum ; i++ ) {
			pop.add(new StatAgent());
		}
	}

	public int getSize() {
		return pop.size();
	}

    public Agent getAgentAtIndex(int i) {
        return (Agent)pop.get(i);
    }

    public void addAgent(Agent a) {
        pop.add(a);
    }

    public void removeAgentAtIndex(int i) {
        Agent a = (Agent)pop.get(i);
        a.getLocation().setAgent(null);
        pop.remove(i);
    }

    public void removeAgent(Agent a) {
        a.getLocation().setAgent(null);
        int i = pop.indexOf(a);
        pop.remove(i);
    }
	
	public void update() {
        for( int i = 0 ; i < pop.size() ; i++ ) {
            Agent a = (Agent)pop.get(i);
			a.update();
		}
	}
}
