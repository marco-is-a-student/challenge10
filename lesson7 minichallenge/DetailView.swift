//
//  DetailView.swift
//  lesson7 minichallenge
//
//  Created by Alvarez Marco Lorenzo Tanzon on 21/8/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var bindedC1:String
    @Binding var bindedHasMilk:Bool
    @Binding var bindedNoOfHoles: Int
    @Binding var bindedTypeOfMilk: String
    
    var body: some View {
        List{ HStack{
           /* Text("Cheese Holes: ")
            Text(String(bindedNoOfHoles))*/
            Stepper(value: $bindedNoOfHoles){
                Text("Cheese Holes: \(bindedNoOfHoles)")
            }
        }
                Toggle("Has Milk", isOn: $bindedHasMilk)
            Menu{
                Button(role: .destructive){
                bindedTypeOfMilk = "Dragon🐉"
                }label: {
                    Text("Dragon🐉")
                }
                Divider()
                Button{
                    bindedTypeOfMilk = "Goat🐐"
                }label: {
                    Text("Goat🐐")
                }
                Button{
                    bindedTypeOfMilk = "Cow🐮"
                }label: {
                    Text("Cow🐮")
                }
                
            } label: {
                if bindedHasMilk == false {
                    
                } else {
                    Text("Type of milk: \(bindedTypeOfMilk) ")
                }//idk how to hide, best alternative, also idk why, but after u quit while "hasMilk" is off, going back in wont show
            }

                HStack{
                    Text("Name of cheese:")
                    TextField("Name of cheese",text: $bindedC1)
                }
        }
        }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bindedC1: .constant("cheeseName1"), bindedHasMilk: .constant(true), bindedNoOfHoles: .constant(0), bindedTypeOfMilk:  .constant("Cow"))
        //ignore the "bindedHasMilk" for now
    }
}
