//
//  VeganIpsumView.swift
//  
//
//  Created by Christian Hoock on 02.03.23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct VeganIpsumView: View {
  
  public static var short: some View {
    HStack {
      Text("🥬 Cozy cinnamon oatmeal parsley creamy cauliflower alfredo sauce green pepper spiced pumpkin chili cherry bomb pepper Chinese five-spice powder bananas zesty tofu pad thai citrusy alfalfa sprouts samosa four-layer tasty strawberry mango smoothie kimchi double dark chocolate ginger carrot spiced juice lemon Thai sun pepper mushroom risotto. Tabasco pepper black bean wraps spiced peppermint blast broccoli asian pear red pepper kale ultra creamy avocado pesto shiitake mushrooms jalapeño Thai basil curry chai tea almond milk cookies hemp seeds grenadillo matcha lime shallots elderberry chia seeds winter blackberries.")
        .font(
          .system(
            size: 18,
            weight: .bold,
            design: .rounded
          )
        )
    }
  }
  
  public static var long: some View {
    HStack {
      Text("🥬 Cozy cinnamon oatmeal parsley creamy cauliflower alfredo sauce green pepper spiced pumpkin chili cherry bomb pepper Chinese five-spice powder bananas zesty tofu pad thai citrusy alfalfa sprouts samosa four-layer tasty strawberry mango smoothie kimchi double dark chocolate ginger carrot spiced juice lemon Thai sun pepper mushroom risotto. Tabasco pepper black bean wraps spiced peppermint blast broccoli asian pear red pepper kale ultra creamy avocado pesto shiitake mushrooms jalapeño Thai basil curry chai tea almond milk cookies hemp seeds grenadillo matcha lime shallots elderberry chia seeds winter blackberries. \n\nHeat tahini drizzle Bolivian rainbow pepper sparkling pomegranate punch dark chocolate raspberries crispy salty pinch of yum green tea Southern Italian orange smoky maple tempeh glaze grains picnic cashew seasonal blood orange smash lychee banana bread vegan. Coconut rice refreshing cucumber splash cozy butternut edamame hummus bite sized pumpkin lemon tahini dressing banana bread dill toasted hazelnuts mediterranean artichoke hearts seitan crumbled lentils edamame morning smoothie bowl ginger lemongrass agave green tea sleepy morning tea tomato and basil springtime strawberry onion. \n\nBanh mi salad rolls rich coconut cream mint muffins lavender lemonade sesame soba noodles blueberry chia seed jam maple orange tempeh coconut milk pomegranate dragon fruit pesto banana figs eating together. Blueberry pops avocado basil pesto veggie burgers candy cane winter simmer peaches lime mango crisp soy milk sriracha pecans comforting pumpkin spice latte thyme cherries chickpea crust pizza portobello mushrooms mint lime taco salsa crispy iceberg lettuce balsamic vinaigrette Bulgarian carrot cumin burritos mediterranean vegetables Indian spiced homemade balsamic. \n\nSeeds lemon lime minty one bowl avocado dressing drizzle coconut sugar cauliflower apples roasted peanuts hot miso dressing scotch bonnet pepper second course lemongrass leek Italian linguine puttanesca Italian pepperoncini roasted brussel sprouts chocolate plums sweet potato mediterranean luxury bowl roasted butternut squash Sicilian pistachio pesto delightful blueberry scones. Sweet potato peach strawberry mango hearty arugula salad pasta cocoa soup cool cucumbers salad vitamin glow creamy cauliflower alfredo summer street style Thai basil tacos entree overflowing couscous cremini mushrooms mocha chocolate main course peanut butter crunch lentils dessert fresh sweet potato black bean burrito strawberry spinach salad.")
        .font(
          .system(
            size: 18,
            weight: .bold,
            design: .rounded
          )
        )
    }
  }
  
  public var body: some View {
    HStack {
      Text("🥬 Cozy cinnamon oatmeal parsley creamy cauliflower alfredo sauce green pepper spiced pumpkin chili cherry bomb pepper Chinese five-spice powder bananas zesty tofu pad thai citrusy alfalfa sprouts samosa four-layer tasty strawberry mango smoothie kimchi double dark chocolate ginger carrot spiced juice lemon Thai sun pepper mushroom risotto. Tabasco pepper black bean wraps spiced peppermint blast broccoli asian pear red pepper kale ultra creamy avocado pesto shiitake mushrooms jalapeño Thai basil curry chai tea almond milk cookies hemp seeds grenadillo matcha lime shallots elderberry chia seeds winter blackberries. \n\nHeat tahini drizzle Bolivian rainbow pepper sparkling pomegranate punch dark chocolate raspberries crispy salty pinch of yum green tea Southern Italian orange smoky maple tempeh glaze grains picnic cashew seasonal blood orange smash lychee banana bread vegan. Coconut rice refreshing cucumber splash cozy butternut edamame hummus bite sized pumpkin lemon tahini dressing banana bread dill toasted hazelnuts mediterranean artichoke hearts seitan crumbled lentils edamame morning smoothie bowl ginger lemongrass agave green tea sleepy morning tea tomato and basil springtime strawberry onion. \n\nBanh mi salad rolls rich coconut cream mint muffins lavender lemonade sesame soba noodles blueberry chia seed jam maple orange tempeh coconut milk pomegranate dragon fruit pesto banana figs eating together. Blueberry pops avocado basil pesto veggie burgers candy cane winter simmer peaches lime mango crisp soy milk sriracha pecans comforting pumpkin spice latte thyme cherries chickpea crust pizza portobello mushrooms mint lime taco salsa crispy iceberg lettuce balsamic vinaigrette Bulgarian carrot cumin burritos mediterranean vegetables Indian spiced homemade balsamic. \n\nSeeds lemon lime minty one bowl avocado dressing drizzle coconut sugar cauliflower apples roasted peanuts hot miso dressing scotch bonnet pepper second course lemongrass leek Italian linguine puttanesca Italian pepperoncini roasted brussel sprouts chocolate plums sweet potato mediterranean luxury bowl roasted butternut squash Sicilian pistachio pesto delightful blueberry scones. Sweet potato peach strawberry mango hearty arugula salad pasta cocoa soup cool cucumbers salad vitamin glow creamy cauliflower alfredo summer street style Thai basil tacos entree overflowing couscous cremini mushrooms mocha chocolate main course peanut butter crunch lentils dessert fresh sweet potato black bean burrito strawberry spinach salad.")
        .font(
          .system(
            size: 18,
            weight: .bold,
            design: .rounded
          )
        )
    }
  }
}

@available(iOS 15.0, *)
struct VeganIpsumView_Previews: PreviewProvider {
  static var previews: some View {
    VeganIpsumView()
  }
}
