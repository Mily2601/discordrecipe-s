# Discord Recipe Bot

A Discord bot for storing, searching, and managing cooking recipes with shopping list generation.

## Features

- 📝 **Add Recipes** - Store recipes with ingredients, instructions, and servings
- 🔍 **Search Recipes** - Find recipes by name or ingredients
- 📖 **View Recipes** - Display detailed recipe information
- 🛒 **Shopping Lists** - Generate combined shopping lists from multiple recipes
- 👨‍🍳 **Personal Cookbook** - View all your added recipes
- 📊 **Statistics** - See bot usage statistics

## Quick Start

### Prerequisites

- Discord Bot Token ([Create one here](https://discord.com/developers/applications))
- Docker and Docker Compose
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/discord-recipe-bot.git
cd discord-recipe-bot
```

2. Create a `.env` file:
```bash
cp .env.example .env
```

3. Edit `.env` and add your Discord bot token:
```
BOT_TOKEN=your_discord_bot_token_here
```

4. Build and run with Docker Compose:
```bash
docker-compose up -d
```

## Usage

### Commands

| Command | Description | Example |
|---------|-------------|---------|
| `!recipe_add` | Add a new recipe | `!recipe_add "Chicken Stir Fry" "2 lbs chicken\n1 cup rice" "Cook chicken, add rice" 4` |
| `!recipe_search` | Search recipes | `!recipe_search chicken` |
| `!recipe_view` | View a recipe | `!recipe_view 1` |
| `!shopping_list` | Generate shopping list | `!shopping_list 1 2 3` |
| `!my_recipes` | View your recipes | `!my_recipes` |
| `!recipe_delete` | Delete a recipe | `!recipe_delete 1` |
| `!recipe_stats` | View statistics | `!recipe_stats` |

### Adding Recipes

Format ingredients with quantities:
```
!recipe_add "Recipe Name" "2 lbs chicken
3 cups rice
1 tbsp oil" "Instructions here" 4
```

The bot automatically parses quantities and units for shopping list generation.

## Deployment

### Docker Compose (Recommended)

```bash
docker-compose up -d
```

### TrueNAS SCALE

1. Go to **Apps** → **Launch Docker Image**
2. Image: `ghcr.io/yourusername/discord-recipe-bot:latest`
3. Add environment variable: `BOT_TOKEN`
4. Add host path volume for `/data`

### Manual Docker

```bash
docker build -t discord-recipe-bot .
docker run -d \
  --name discord-recipe-bot \
  -e BOT_TOKEN=your_token \
  -v $(pwd)/data:/data \
  --restart unless-stopped \
  discord-recipe-bot
```

## Development

### Local Development

1. Create virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the bot:
```bash
python recipe_bot.py
```

### Project Structure

```
discord-recipe-bot/
├── recipe_bot.py      # Main bot code
├── Dockerfile         # Docker image definition
├── docker-compose.yml # Docker Compose configuration
├── requirements.txt   # Python dependencies
├── .env.example      # Environment variable template
├── .gitignore        # Git ignore file
└── data/             # Persistent data directory
    └── recipes.db    # SQLite database
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- Create an issue for bugs or feature requests
- Join our Discord server: [link]
- Check the [Wiki](../../wiki) for detailed documentation