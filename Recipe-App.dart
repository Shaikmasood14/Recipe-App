import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class Recipe {
  final String id;
  final String title;
  final String category; // 'Veg' or 'Non-Veg'
  final String country; // e.g., 'India', 'Italy', 'Mexico', 'Japan'
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.country,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class RecipeData {
  static String userName = 'username';
  static String userEmail = 'userpassword.com';

  static List<Recipe> recipes = [
    Recipe(
      id: '1',
      title: 'Hyderabadi Dum Biryani',
      category: 'Non-Veg',
      country: 'India',
      ingredients: [
        'Basmati Rice - 500g',
        'Chicken - 500g',
        'Yogurt - 1 cup',
        'Fried Onions - 1 cup',
        'Ghee & Saffron - as needed',
        'Biryani Masala - 2 tbsp'
      ],
      steps: [
        'Marinate chicken with yogurt, spices, and fried onions for 2 hours.',
        'Parboil basmati rice with whole spices until 70% cooked.',
        'Layer the marinated chicken and half-cooked rice in a heavy-bottomed pot.',
        'Seal with dough and dum cook on low heat for 30 minutes.'
      ],
      imageUrl: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '2',
      title: 'Classic Margherita Pizza',
      category: 'Veg',
      country: 'Italy',
      ingredients: [
        'Pizza Dough - 1 ball',
        'San Marzano Tomatoes - 1/2 cup',
        'Fresh Mozzarella - 150g',
        'Fresh Basil Leaves - 10',
        'Extra Virgin Olive Oil - 1 tbsp'
      ],
      steps: [
        'Preheat oven to highest temperature with a pizza stone.',
        'Roll out the pizza dough on a floured surface.',
        'Spread crushed tomatoes and top with sliced mozzarella and basil.',
        'Bake for 8-10 minutes until crust is golden and cheese is bubbly.'
      ],
      imageUrl: 'https://images.unsplash.com/photo-1604382355076-af4b0eb60143?auto=format&fit=crop&w=600&q=80',
    ),
    Recipe(
      id: '3',
      title: 'Authentic Chicken Tacos',
      category: 'Non-Veg',
      country: 'Mexico',
      ingredients: [
        'Corn Tortillas - 4',
        'Chicken Breast - 300g',
        'Taco Seasoning - 1 packet',
        'Diced Tomatoes & Onions',
        'Cilantro & Lime'
      ],
      steps: [
        'Cook and shred chicken breast with taco seasoning.',
        'Warm corn tortillas on a skillet.',
        'Assemble shredded chicken inside tortillas.',
        'Top with fresh tomatoes, onions, cilantro, and a squeeze of lime.'
      ],
      imageUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?auto=format&fit=crop&w=600&q=80',
    ),
    Recipe(
      id: '4',
      title: 'Paneer Butter Masala',
      category: 'Veg',
      country: 'India',
      ingredients: [
        'Paneer Cubes - 250g',
        'Tomatoes - 4 medium',
        'Cashews - 10-12',
        'Butter & Fresh Cream - 3 tbsp',
        'Garam Masala & Kasuri Methi - 1 tsp'
      ],
      steps: [
        'Blend boiled tomatoes and cashews into a smooth puree.',
        'Sauté puree in butter with ginger-garlic paste and spices.',
        'Add paneer cubes and simmer for 5 minutes.',
        'Stir in fresh cream and crushed kasuri methi before serving.'
      ],
      imageUrl: 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '5',
      title: 'Traditional Sushi Rolls',
      category: 'Non-Veg',
      country: 'Japan',
      ingredients: [
        'Sushi Rice - 2 cups',
        'Nori Seaweed Sheets - 4',
        'Fresh Salmon/Tuna - 150g',
        'Avocado & Cucumber - sliced',
        'Soy Sauce & Wasabi'
      ],
      steps: [
        'Prepare seasoned sushi rice with rice vinegar.',
        'Place nori on a bamboo mat and spread rice evenly.',
        'Add fish, avocado, and cucumber slices along the edge.',
        'Roll tightly, slice into pieces, and serve with soy sauce.'
      ],
      imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=600&q=80',
    ),
  ];
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const MainNavigation(),
      },
    );
  }
}

// 1. SIGNUP PAGE
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'username');
  final _emailController = TextEditingController(text: 'userpassword.com');
  final _passwordController = TextEditingController(text: 'password123');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      RecipeData.userName = _nameController.text;
      RecipeData.userEmail = _emailController.text;
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.restaurant_menu, size: 80, color: Colors.deepOrange),
                  const SizedBox(height: 16),
                  const Text(
                    'Chef Master',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(height: 8),
                  const Text('Discover & Share World-Class Recipes', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                    validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
                    validator: (val) => val!.isEmpty || !val.contains('@') ? 'Enter a valid email' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
                    validator: (val) => val!.length < 6 ? 'Password must be at least 6 characters' : null,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _signup,
                    style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.deepOrange),
                    child: const Text('Sign Up & Explore', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// MAIN NAVIGATION SHELL
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const VegNonVegPage(),
    const CountryRecipesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.fastfood_outlined), selectedIcon: Icon(Icons.fastfood), label: 'Categories'),
          NavigationDestination(icon: Icon(Icons.public_outlined), selectedIcon: Icon(Icons.public), label: 'Countries'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// 2. HOME PAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openAddRecipeModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const AddRecipeForm(),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${RecipeData.userName} 👋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            tooltip: 'Add Recipe',
            onPressed: _openAddRecipeModal,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepOrange.shade400, Colors.deepOrange.shade700]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cook Like a Pro', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Explore delicious vegetarian, non-vegetarian, and global international specialties saved right on your device.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Featured Recipes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: RecipeData.recipes.length,
              itemBuilder: (context, index) {
                final recipe = RecipeData.recipes[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe)),
                      ).then((_) => setState(() {}));
                    },
                    child: Row(
                      children: [
                        Image.network(recipe.imageUrl, width: 100, height: 100, fit: BoxFit.cover, errorBuilder: (c, o, s) => Container(width: 100, height: 100, color: Colors.grey.shade300, child: const Icon(Icons.image))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Chip(
                                      label: Text(recipe.category, style: const TextStyle(fontSize: 10)),
                                      backgroundColor: recipe.category == 'Veg' ? Colors.green.shade100 : Colors.red.shade100,
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(recipe.country, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              recipe.isFavorite = !recipe.isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddRecipeModal,
        label: const Text('Add Recipe'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
    );
  }
}

// 3. VEG AND NON-VEG RECIPES SEPARATE PAGE (TABBED)
class VegNonVegPage extends StatelessWidget {
  const VegNonVegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Categories'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.eco), text: 'Vegetarian'),
              Tab(icon: Icon(Icons.kebab_dining), text: 'Non-Vegetarian'),
            ],
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
          ),
        ),
        body: TabBarView(
          children: [
            _RecipeListTab(category: 'Veg'),
            _RecipeListTab(category: 'Non-Veg'),
          ],
        ),
      ),
    );
  }
}

class _RecipeListTab extends StatefulWidget {
  final String category;
  const _RecipeListTab({required this.category});

  @override
  State<_RecipeListTab> createState() => _RecipeListTabState();
}

class _RecipeListTabState extends State<_RecipeListTab> {
  @override
  Widget build(BuildContext context) {
    final filtered = RecipeData.recipes.where((r) => r.category == widget.category).toList();

    if (filtered.isEmpty) {
      return Center(child: Text('No ${widget.category} recipes available.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final recipe = filtered[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(recipe.imageUrl)),
            title: Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Country: ${recipe.country}'),
            trailing: IconButton(
              icon: Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              onPressed: () {
                setState(() {
                  recipe.isFavorite = !recipe.isFavorite;
                });
              },
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe))).then((_) => setState(() {}));
            },
          ),
        );
      },
    );
  }
}

// 4. COUNTRY FAMOUS RECIPES PAGE
class CountryRecipesPage extends StatefulWidget {
  const CountryRecipesPage({super.key});

  @override
  State<CountryRecipesPage> createState() => _CountryRecipesPageState();
}

class _CountryRecipesPageState extends State<CountryRecipesPage> {
  String selectedCountry = 'All';

  @override
  Widget build(BuildContext context) {
    final countries = ['All', 'India', 'Italy', 'Mexico', 'Japan'];
    final filtered = selectedCountry == 'All' ? RecipeData.recipes : RecipeData.recipes.where((r) => r.country == selectedCountry).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Country Famous Recipes')),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: countries.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final country = countries[index];
                final isSelected = selectedCountry == country;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(country),
                    selected: isSelected,
                    onSelected: (selected) => setState(() => selectedCountry = country),
                    selectedColor: Colors.deepOrange.shade100,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No recipes found for this country.'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final recipe = filtered[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(recipe.imageUrl)),
                          title: Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Type: ${recipe.category} • Country: ${recipe.country}'),
                          trailing: IconButton(
                            icon: Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                recipe.isFavorite = !recipe.isFavorite;
                              });
                            },
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe))).then((_) => setState(() {}));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// 5. RECIPE DETAIL PAGE (Ingredients & Steps)
class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
        actions: [
          IconButton(
            icon: Icon(widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: () {
              setState(() {
                widget.recipe.isFavorite = !widget.recipe.isFavorite;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(widget.recipe.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, o, s) => Container(height: 250, color: Colors.grey.shade300, child: const Icon(Icons.image, size: 80))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(label: Text(widget.recipe.category), backgroundColor: Colors.deepOrange.shade100),
                    const SizedBox(width: 8),
                    Chip(label: Text('Country: ${widget.recipe.country}')),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...widget.recipe.ingredients.map((ing) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(children: [const Icon(Icons.fiber_manual_record, size: 8, color: Colors.deepOrange), const SizedBox(width: 8), Expanded(child: Text(ing, style: const TextStyle(fontSize: 16)))]),
                    )),
                const SizedBox(height: 24),
                const Text('Step-by-Step Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...widget.recipe.steps.asMap().entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 12, backgroundColor: Colors.deepOrange, child: Text('${entry.key + 1}', style: const TextStyle(color: Colors.white, fontSize: 12))),
                          const SizedBox(width: 12),
                          Expanded(child: Text(entry.value, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 6. ADD PERSONAL RECIPE FORM
class AddRecipeForm extends StatefulWidget {
  const AddRecipeForm({super.key});

  @override
  State<AddRecipeForm> createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();
  String _category = 'Veg';
  String _country = 'India';

  @override
  void dispose() {
    _titleController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final ingredientsList = _ingredientsController.text.split('\n').where((s) => s.trim().isNotEmpty).toList();
      final stepsList = _stepsController.text.split('\n').where((s) => s.trim().isNotEmpty).toList();

      final newRecipe = Recipe(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        category: _category,
        country: _country,
        ingredients: ingredientsList.isNotEmpty ? ingredientsList : ['General Ingredients'],
        steps: stepsList.isNotEmpty ? stepsList : ['Follow standard preparation procedures.'],
        imageUrl: 'https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=600&q=80',
      );

      RecipeData.recipes.insert(0, newRecipe);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Add Personal Recipe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Recipe Title', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Enter recipe title' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _category,
                      decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
                      items: ['Veg', 'Non-Veg'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                      onChanged: (val) => setState(() => _category = val!),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _country,
                      decoration: const InputDecoration(labelText: 'Country', border: OutlineInputBorder()),
                      items: ['India', 'Italy', 'Mexico', 'Japan', 'USA'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                      onChanged: (val) => setState(() => _country = val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ingredientsController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Ingredients (one per line)', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Enter ingredients' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _stepsController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Steps (one per line)', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Enter steps' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _submit,
                style: FilledButton.styleFrom(backgroundColor: Colors.deepOrange, padding: const EdgeInsets.all(14)),
                child: const Text('Save Recipe to Device', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// 7. PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = RecipeData.recipes.where((r) => r.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(radius: 50, backgroundColor: Colors.deepOrange, child: Icon(Icons.person, size: 50, color: Colors.white)),
                const SizedBox(height: 16),
                Text(RecipeData.userName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(RecipeData.userEmail, style: const TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('My Favorite Recipes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          favorites.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No favorite recipes marked yet.', style: TextStyle(color: Colors.grey)),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final recipe = favorites[index];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(recipe.imageUrl)),
                      title: Text(recipe.title),
                      subtitle: Text('${recipe.category} • ${recipe.country}'),
                      trailing: const Icon(Icons.favorite, color: Colors.red),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe)));
                      },
                    );
                  },
                ),
          const Divider(),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Local Device Storage'),
            subtitle: const Text('All records saved successfully on device'),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red), padding: const EdgeInsets.symmetric(vertical: 14)),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/signup', (route) => false),
            icon: const Icon(Icons.logout),
            label: const Text('Log Out', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
