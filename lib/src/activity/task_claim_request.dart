/// ActivityTaskClaimDto：领取已完成任务金币。
class TaskClaimRequest {
  /// 来自 tasks[].userTaskId。
  final int userTaskId;

  const TaskClaimRequest({required this.userTaskId});

  Map<String, dynamic> toJson() => {'userTaskId': userTaskId};
}
