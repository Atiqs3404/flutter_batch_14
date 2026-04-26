class Urls {
  static String _baseUrl = "https://task-manager-api.ostad.live/api/v1";

  static String signUpUrl = "$_baseUrl/Registration";

  static String signInUrl = "$_baseUrl/Login";

  static String createTaskUrl = "$_baseUrl/createTask";

  static String taskCountUrl = "$_baseUrl/taskStatusCount";

  static String taskByStatusUrl(String status) =>
      "$_baseUrl/listTaskByStatus/$status";

  static String deleteTaskUrl(String id) => "$_baseUrl/deleteTask/$id";
}
