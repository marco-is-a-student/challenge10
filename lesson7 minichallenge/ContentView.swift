//
//  ContentView.swift
//  lesson7 minichallenge
//
//  Created by Alvarez Marco Lorenzo Tanzon on 21/8/23.
//
import SwiftUI
struct cheeseProperties{
    var name:String
    var hasMilk:Bool
    var noOfHoles:Int
    var milkType: String
    var id = UUID()
}

struct ContentView: View {
    @State var newCheeseName: String
    @State var newCheeseHoles: Int
    @State var newCheeseMilk: Bool
    @State var newCheeseType: String
    @State var cheeseArray = [cheeseProperties(name: "Swift Cheese", hasMilk: false, noOfHoles: 14, milkType: "Dragon"), cheeseProperties(name: "Java Cheese", hasMilk: true, noOfHoles: 500000, milkType: "Goat"),cheeseProperties(name: "Cheese++", hasMilk: true, noOfHoles: 1, milkType: "Cow")]
    @State var sheetShown:Bool = false
    var body: some View {
        TabView{
            NavigationStack{
                VStack {
                    List{
                        ForEach($cheeseArray, id:\.id){ $cheeseProperties in
                            Section{
                                NavigationLink{
                                    DetailView(bindedC1: $cheeseProperties.name, bindedHasMilk: $cheeseProperties.hasMilk, bindedNoOfHoles:$cheeseProperties.noOfHoles, bindedTypeOfMilk: $cheeseProperties.milkType)
                                } label: {
                                    VStack{
                                        Text(cheeseProperties.name)
                                        HStack{
                                            Text("Milk? \(String(cheeseProperties.hasMilk))")
                                                .padding()
                                            Text("\(String(cheeseProperties.noOfHoles))x🕳️"
                                            )
                                            .padding()
                                            if cheeseProperties.hasMilk == true{ Text("\(cheeseProperties.milkType)")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $sheetShown){
                    List{
                        Stepper(value: $newCheeseHoles){
                            Text("Number of holes: \(newCheeseHoles)")
                        }
                        Toggle("Has Milk", isOn: $newCheeseMilk)
                        HStack{
                            Text("Name of cheese:")
                            TextField("Name of cheese",text: $newCheeseName)
                        }
                        Menu{
                            Button(role: .destructive){
                                newCheeseType = "Dragon🐉"
                            }label: {
                                Text("Dragon🐉")
                            }
                            Divider()
                            Button{
                                newCheeseType = "Goat🐐"
                            }label: {
                                Text("Goat🐐")
                            }
                            Button{
                                newCheeseType = "Cow🐮"
                            }label: {
                                Text("Cow🐮")
                            }
                            
                        } label: {
                            if newCheeseMilk == false {
                                
                            } else {
                                Text("Type of milk: \(newCheeseType) ")
                            }//idk how to hide, best alternative, also idk why, but after u quit while "hasMilk" is off, going back in wont show
                        }
                        Button{
                            cheeseArray.append(cheeseProperties(name: newCheeseName, hasMilk: newCheeseMilk, noOfHoles: newCheeseHoles, milkType: newCheeseType))
                            newCheeseName = "Enter cheese name"
                            newCheeseMilk = true
                            newCheeseHoles = 0
                            
                        } label: {
                            Text("Save choices")
                                .accentColor(.gray)
                                .padding()
                                .background(
                                    Color.black
                                        .cornerRadius(5))
                        }
                        
                    }
                }
                
                .navigationTitle("Cheese")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            sheetShown.toggle()
                        } label: {
                            Text("+")
                        }
                    }
                }
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(newCheeseName: "Enter cheese name", newCheeseHoles: 0, newCheeseMilk: true, newCheeseType: "Cow")
    }
}
