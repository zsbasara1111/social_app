// Demo mode - no real Supabase connection
class SupabaseService {
  // Mock client for demo
  static dynamic get client => null;

  // Auth helpers (mock for demo)
  static dynamic get currentUser => null;
  static dynamic get currentSession => null;
  static bool get isAuthenticated => true; // Demo mode: always authenticated
  static String? get currentUserId => 'demo_user_id'; // Demo user ID

  // Auth methods (mock for demo)
  static Future<dynamic> signUpWithPhone({
    required String phone,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  static Future<void> signInWithOTP({
    required String phone,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  static Future<dynamic> verifyOTP({
    required String phone,
    required String token,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  static Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // Realtime subscriptions (mock)
  static dynamic subscribeToTable({
    required String table,
    required String event,
    required Function(dynamic) callback,
  }) {
    return null;
  }

  // Storage helpers (mock)
  static String getPublicUrl(String bucket, String path) {
    return '';
  }

  static Future<String> uploadFile({
    required String bucket,
    required String path,
    required List<int> fileBytes,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return '';
  }

  static Future<void> deleteFile({
    required String bucket,
    required String path,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
