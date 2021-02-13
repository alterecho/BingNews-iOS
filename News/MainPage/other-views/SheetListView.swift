//
//  SheetListView.swift
//  News
//
//  Created by Vijay Chandran Jayachandran on 13/2/21.
//  Copyright © 2021 v.a.jayachandran. All rights reserved.
//

import SwiftUI

struct SheetListView: View {
    var list: [String]
    
    var body: some View {
        List(list, id: \.self) { item in
            Text(item)
        }
    }
}

struct CategoriesSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SheetListView(list: [])
    }
}
