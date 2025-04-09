import 'package:supabase_flutter/supabase_flutter.dart';

class SongsService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchSongs() async {
    final response = await _supabase.from('songs').select();
    
    if (response.isEmpty) {
      print("No songs found in Supabase!");
    } else {
      print("Songs from Supabase: $response");
    }

    return List<Map<String, dynamic>>.from(response);
  }
}
