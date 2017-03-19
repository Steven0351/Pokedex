//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Steven Sherry on 3/18/17.
//  Copyright © 2017 Affinity for Apps. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "\(pokemon.pokedexID)")
        mainImage.image = image
        currentEvoImage.image = image
        pokedexLabel.text = "\(pokemon.pokedexID)"
        nameLabel.text = pokemon.name.capitalized
        pokemon.downloadPokemonDetail() {
            
            self.updateUI()
        }
    }

    func updateUI() {
        typeLabel.text = pokemon.type
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }
  
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
