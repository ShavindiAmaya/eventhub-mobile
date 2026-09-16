class Event {
  final String id;
  final String name;
  final String description;
  final DateTime date;
  final String location;
  final String category;
  final double price;
  final int availableSeats;
  final String imageUrl;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.category,
    required this.price,
    required this.availableSeats,
    required this.imageUrl,
  });
}

final List<Event> mockEvents = [
  Event(
    id: '1',
    name: 'Colombo Tech Conference 2026',
    description: 'A deep dive into the latest in cross-platform development and AI trends in Sri Lanka.',
    date: DateTime(2026, 3, 15, 9, 0),
    location: 'BMICH, Colombo',
    category: 'Technology',
    price: 5000.00,
    availableSeats: 50,
    imageUrl: 'https://images.unsplash.com/photo-1540575861501-7ad05823c23d?q=80&w=2070&auto=format&fit=crop',
  ),
  Event(
    id: '2',
    name: 'සංගීත සැඳෑව 2026',
    description: 'An evening of classical and contemporary Sri Lankan music featuring top local artists.',
    date: DateTime(2026, 5, 20, 18, 30),
    location: 'Nelum Pokuna, Colombo',
    category: 'Music',
    price: 3500.00,
    availableSeats: 200,
    imageUrl: 'https://images.unsplash.com/photo-1459749411177-042180ceea72?q=80&w=2070&auto=format&fit=crop',
  ),
  Event(
    id: '3',
    name: 'Food Festival Colombo',
    description: 'Sample the finest Sri Lankan street food and international cuisines at Galle Face.',
    date: DateTime(2026, 8, 10, 16, 0),
    location: 'Galle Face, Colombo',
    category: 'Food',
    price: 1500.00,
    availableSeats: 500,
    imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop',
  ),
  Event(
    id: '4',
    name: 'Mobile App Workshop',
    description: 'Hands-on training session for Flutter development for university students.',
    date: DateTime(2026, 2, 12, 9, 30),
    location: 'University of Kelaniya',
    category: 'Technology',
    price: 1000.00,
    availableSeats: 40,
    imageUrl: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=2070&auto=format&fit=crop',
  ),
];
