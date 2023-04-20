import 'help_request.dart';
import 'help_request_repository.dart';

class HelpRequestController {
  HelpRequestController();
  final HelpRequestRepository _helpRequestRepo = HelpRequestRepository();

  Future<List<HelpRequest>> getAllRequest() {
    return _helpRequestRepo.getAllRequest();
  }

   Future<HelpRequest> addHelpRequest(HelpRequest request) {
    return _helpRequestRepo.addHelpRequest(request);
  }
}
