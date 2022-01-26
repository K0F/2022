
Network network;

void setup(){
  size(320,240);
  network = new Network("3,16,4,16,3");
}

void draw(){
  background(0);
  network.draw();
}

class Network{
  ArrayList layers,connections;

  Network(String schema){
    layers = parseSchema(schema);
    fullyConnect(layers);
  }

  ArrayList parseSchema(String _in){
    ArrayList tmp = new ArrayList();;
    String args[] = splitTokens(_in,":,- ");
    for(int i =0;i<args.length;i++){
      tmp.add(new Layer(parseInt(args[i]),i));
    }
    return tmp;
  }

  void fullyConnect(ArrayList _schema){

    connections = new ArrayList();
    for(int i = 1 ; i < _schema.size();i++){
      Layer tmplA = (Layer)_schema.get(i-1); 
      Layer tmplB = (Layer)_schema.get(i);

      for(int ii = 0 ; ii < tmplA.neurons.size();ii++){
        Neuron n1 = (Neuron)tmplA.neurons.get(ii);
        for(int iii = 0 ; iii < tmplB.neurons.size();iii++){
        Neuron n2 = (Neuron)tmplB.neurons.get(iii);
        connections.add(new Connection(ii,n1,iii,n2));
        
        }

      }
    }

  }

  void draw(){

    noStroke();
    fill(255);
    pushMatrix();
    translate(20,height/2-50);
    for(int i = 0 ; i < layers.size();i++){
      int x = i * 10;
      Layer tmp = (Layer)layers.get(i);
      int num = (tmp.neurons.size());
      for(int ii = 0 ; ii < num;ii++){
        int y = ii * 5;

        rect(x,y,2,2);
      }
    }
    popMatrix();
  }
}

class Layer{
  ArrayList neurons;
  int id;

  Layer(int _num,int _id){
    neurons = new ArrayList();
    for(int i = 0 ; i < _num;i++){
      neurons.add(new Neuron(_id));
    }
  }

}

class Connection{
  int idA, idB;
  Neuron A,B;
  float weight;

  Connection(int _idA,Neuron _A,int _idB,Neuron _B){
    idA=_idA;
    idB=_idB;
    A=_A;
    B=_B;
    weight = 0.5;
  }

}

class Neuron{

  int layerNo;

  Neuron(int _layerNo){
    layerNo = layerNo;
  }



}
