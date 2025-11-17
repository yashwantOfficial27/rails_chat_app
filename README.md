# Chat Rails - Founder Engineer Notes

## 🎯 MVP Goal
Build a real-time chat application that teaches Rails + Networking concepts.

## 🏗️ Architecture Decisions

### Why SQLite?
- Zero setup - ship faster
- Perfect for development and learning
- Easy to inspect (just a file!)
- Switch to PostgreSQL later when deploying

### Why Async Adapter for ActionCable?
- No Redis dependency during development
- Simpler local setup
- Learn WebSocket concepts first
- Add Redis when scaling (production)

### Why No Devise Yet?
- Learn authentication fundamentals first
- Understand bcrypt, sessions, cookies
- Add Devise later when you know WHY you need it

## 📚 Learning Path

### Phase 1: Basic CRUD (You are here!)
- [ ] Understand MVC pattern
- [ ] Build Room and Message models
- [ ] Create simple authentication
- [ ] Learn routing

### Phase 2: Real-time Features
- [ ] ActionCable basics (WebSockets)
- [ ] Turbo Streams for live updates
- [ ] Broadcasting to channels
- [ ] Connection management

### Phase 3: Polish
- [ ] Stimulus controllers for UX
- [ ] User presence (online/offline)
- [ ] Typing indicators
- [ ] Message notifications

### Phase 4: Scale & Deploy
- [ ] Switch to PostgreSQL
- [ ] Add Redis for ActionCable
- [ ] Deploy to Fly.io/Render
- [ ] Add background jobs

## 🚀 Next Steps

1. Start Rails server:
   ```bash
   bin/rails server
   ```

2. Visit: http://localhost:3000

3. Login with: alice / password

4. Start building views (minimal ERB!)

## 🎓 What You'll Learn

### Rails Concepts
- MVC architecture
- Active Record associations
- ActionCable (WebSockets)
- Turbo & Stimulus (Hotwire)
- Sessions & authentication
- Background jobs

### Networking Concepts
- HTTP request/response cycle
- WebSocket protocol
- Long-polling vs WebSockets
- Client-server architecture
- Broadcasting patterns
- Connection lifecycle

### Founder Engineering
- Ship MVPs fast
- Make pragmatic decisions
- Learn by building
- Iterate based on usage
- Scale when needed (not before!)

## 💡 Founder Mindset Reminders

1. **Perfect is the enemy of shipped**
2. **You can't learn from code that doesn't run**
3. **Build, measure, learn - repeat**
4. **Complexity is your enemy**
5. **Users don't care about your tech stack**

## 🔧 Useful Commands

```bash
# Start server
bin/rails s

# Console (play with models)
bin/rails c

# Run migrations
bin/rails db:migrate

# Reset database (fresh start)
bin/rails db:reset

# Check routes
bin/rails routes

# Generate model
bin/rails g model ModelName field:type

# Generate controller
bin/rails g controller ControllerName action1 action2
```

## 📁 File Structure (Minimal ERB!)

```
app/
├── channels/
│   └── room_channel.rb          # WebSocket logic
├── controllers/
│   ├── rooms_controller.rb      # Room CRUD
│   ├── messages_controller.rb   # Send messages
│   └── sessions_controller.rb   # Login/logout
├── models/
│   ├── room.rb                  # Room model
│   ├── message.rb               # Message model
│   └── user.rb                  # User model
├── views/
│   ├── layouts/
│   │   └── application.html.erb # Main layout (1 file)
│   ├── pages/
│   │   └── home.html.erb        # Landing page
│   ├── rooms/
│   │   ├── index.html.erb       # List rooms
│   │   └── show.html.erb        # Chat interface
│   └── messages/
│       └── _message.html.erb    # Message partial (Turbo)
└── javascript/
    ├── controllers/             # Stimulus JS
    └── channels/
        └── room_channel.js      # ActionCable JS client
```

Total ERB files: ~6 files! Everything else is JS and Ruby.

## 🐛 Common Issues

### ActionCable not working?
- Check `config/cable.yml` uses `async` adapter
- Verify `config/routes.rb` mounts ActionCable

### Can't login?
- Run `bin/rails db:seed` to create test users
- Check User model has `has_secure_password`

### Tailwind not working?
- Run `bin/rails tailwindcss:watch`
- Check `app/assets/stylesheets/application.tailwind.css` exists

## 🎯 Next: Build the Views!

Ready to create minimal ERB files and see it work!