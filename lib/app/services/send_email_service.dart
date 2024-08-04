import 'package:emailjs/emailjs.dart' as emailjs;

class SendEmailService {
  static Future<void> sendCode({required String email, required String code}) async {
    Map<String, dynamic> templateParams = {'code': code, 'to_email': email};
    await emailjs.send(
      'service_awhbvdh',
      'template_hqvu3qn',
      templateParams,
      const emailjs.Options(
        publicKey: 'Y3S5a3YGMYKiUon51',
        privateKey: '29doFkaw_vZQyDdTvJP1t',
      ),
    );
  }
}
