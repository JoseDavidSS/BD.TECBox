//
//  PackageView.swift
//  TECBox
//
//  Created by Alejandro Ibarra on 3/7/20.
//  Copyright © 2020 Schlafenhase. All rights reserved.
//

import SwiftUI

struct PackageView: View {
    let packages = Bundle.main.decode([PackageSection].self, from: "packages.json")
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "Background")
        UITableViewCell.appearance().backgroundColor = UIColor(named: "Background")
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        RefreshableNavigationView(title: "Packages", action:{
            self.updatePackages()
        }){
            ForEach(self.packages) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        PackageRow(package: item)
                    }
                }
            }
        }
    }
    
    func updatePackages() {
        
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
