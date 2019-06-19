# 1 "ParseConfigData.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ParseConfigData.cpp"
# 1 "ParseConfigData.h" 1
# 1 "./inc/common_def.h" 1
# 11 "./inc/common_def.h"
  typedef unsigned char uint8;



  typedef unsigned char byte;



  typedef unsigned short uint16;



  typedef unsigned int uint32;




  typedef unsigned char boolean;
# 2 "ParseConfigData.h" 2
# 1 "./inc/simlock_common.h" 1
# 138 "./inc/simlock_common.h"
typedef enum {
  SIMLOCK_SUCCESS,
  SIMLOCK_GENERIC_ERROR,
  SIMLOCK_INCORRECT_KEY,
  SIMLOCK_INCORRECT_PARAMS,
  SIMLOCK_MEMORY_ERROR_HEAP_EXHAUSTED,
  SIMLOCK_MAX_RETRIES_REACHED,
  SIMLOCK_INVALID_STATE,
  SIMLOCK_UNSUPPORTED,
  SIMLOCK_INVALID_LOCK_DATA,
  SIMLOCK_CONFLICTING_LOCK_DATA,
  SIMLOCK_RSU_DATA_TOO_SHORT,
  SIMLOCK_RSU_GET_TIME_FAILED,
  SIMLOCK_RSU_DATA_VALIDATION_FAILED,
  SIMLOCK_RSU_IMEI_VALIDATION_FAILED,
  SIMLOCK_RSU_STALE_DATA,
  SIMLOCK_RSU_INCOMPATIBLE_STATE
} simlock_result_enum_type;







typedef enum {
  SIMLOCK_INIT_MSG,
  SIMLOCK_SET_SIMLOCK_POLICY_MSG,
  SIMLOCK_SET_LOCK_HCK_MSG,
  SIMLOCK_SET_LOCK_CK_MSG,
  SIMLOCK_UNLOCK_DEVICE_MSG,
  SIMLOCK_RUN_ALGORITHM_MSG,
  SIMLOCK_GET_STATUS_MSG,
  SIMLOCK_GET_CATEGORY_DATA_MSG,
  SIMLOCK_TEMPORARY_UNLOCK_MSG,
  SIMLOCK_SET_DEVICE_MODE_MSG,
  SIMLOCK_ADD_LOCK_CODES_HCK_MSG,
  SIMLOCK_ADD_LOCK_CODES_CK_MSG,
  SIMLOCK_RELOCK_DEVICE_MSG,
  SIMLOCK_SET_RSU_MODE_MSG,
  SIMLOCK_CHANGE_CK_MSG,
  SIMLOCK_CHANGE_LIST_TYPE_MSG,
  SIMLOCK_SET_RSU_DEVICE_KEY_MSG
} simlock_message_enum_type;







typedef enum {
  SIMLOCK_SET_POLICY_OPERATION,

  SIMLOCK_SET_POLICY_AND_SLOT_CONFIG_OPERATION,

  SIMLOCK_SET_SLOT_CONFIG_OPERATION

} simlock_set_operation_enum_type;
# 205 "./inc/simlock_common.h"
typedef enum {
  SIMLOCK_SLOT_POLICY_SAME_ON_ALL_SLOTS,

  SIMLOCK_SLOT_POLICY_UNIQUE_FOR_EACH_SLOT,


  SIMLOCK_SLOT_POLICY_LOCK_ONLY_SLOT_1,


  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_SLOT_1,

  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_ANY_SLOT,


  SIMLOCK_SLOT_POLICY_MASTER_SLOT_1,


  SIMLOCK_SLOT_POLICY_BLOCK_ALL_SLOTS_IF_SLOT_1_EXPIRED,


  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_SLOT_1,


  SIMLOCK_SLOT_POLICY_BLOCK_ALL_SLOTS_IF_ALL_VALID_SLOTS_EXPIRED,


  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_ANY_VALID_SLOT,



  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_ANY_VALID_SLOT_OR_IMSI_MATCH,



  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_ALL_SLOTS,


  SIMLOCK_SLOT_POLICY_MAX
} simlock_slot_policy_enum_type;







typedef enum {
  SIMLOCK_SUBSCRIPTION_POLICY_INDEPENDENT,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_AND_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_OR_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_MAX
} simlock_subscription_policy_enum_type;







typedef enum {
  SIMLOCK_RSU_MODE_NO_RSU,
  SIMLOCK_RSU_MODE_A,
  SIMLOCK_RSU_MODE_B,
  SIMLOCK_RSU_MODE_C,
  SIMLOCK_RSU_MODE_D,
  SIMLOCK_RSU_MODE_E,
  SIMLOCK_RSU_MODE_F,
  SIMLOCK_RSU_MODE_MAX
} simlock_rsu_mode_enum_type;







typedef enum {
  SIMLOCK_SUBSCRIPTION_NONE,
  SIMLOCK_SUBSCRIPTION_3GPP,
  SIMLOCK_SUBSCRIPTION_3GPP2
} simlock_subscription_enum_type;







typedef enum {
  SIMLOCK_CATEGORY_3GPP_NW,
  SIMLOCK_CATEGORY_3GPP_NS,
  SIMLOCK_CATEGORY_3GPP_SP,
  SIMLOCK_CATEGORY_3GPP_CP,
  SIMLOCK_CATEGORY_3GPP_SPN,
  SIMLOCK_CATEGORY_3GPP_SP_EHPLMN,
  SIMLOCK_CATEGORY_3GPP_ICCID,
  SIMLOCK_CATEGORY_3GPP_IMPI,
  SIMLOCK_CATEGORY_3GPP_NS_SP,
  SIMLOCK_CATEGORY_3GPP_SIM,

  SIMLOCK_CATEGORY_3GPP2_NW_TYPE1,
  SIMLOCK_CATEGORY_3GPP2_NW_TYPE2,
  SIMLOCK_CATEGORY_3GPP2_HRPD,
  SIMLOCK_CATEGORY_3GPP2_SP,
  SIMLOCK_CATEGORY_3GPP2_CP,
  SIMLOCK_CATEGORY_3GPP2_RUIM
} simlock_category_enum_type;







typedef enum {
  SIMLOCK_SLOT_1 = 0,

  SIMLOCK_SLOT_2,

  SIMLOCK_SLOT_3,

  SIMLOCK_SLOT_4,

  SIMLOCK_SLOT_NUM
} simlock_slot_enum_type;







typedef enum {
  SIMLOCK_SRV_STATUS_NONE,
  SIMLOCK_SRV_STATUS_EXPIRED,
  SIMLOCK_SRV_STATUS_FULL
} simlock_app_service_status_enum_type;







typedef enum {
  SIMLOCK_TEMPORARY_UNLOCK_SET,
  SIMLOCK_TEMPORARY_UNLOCK_UNSET
} simlock_temporary_unlock_request_enum_type;







typedef enum {
  SIMLOCK_DEVICE_NORMAL_OPERATION_MODE = 0,
  SIMLOCK_DEVICE_EMERGENCY_ONLY_MODE
} simlock_device_mode_enum_type;







typedef enum {
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_NONE,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_LOCKED_WITH_CK,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_LOCKED_WITHOUT_CK,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_EMERGENCY_ONLY,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_REQUIRED_BUT_LOCKED,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_REQUIRED_BUT_NOT_PRESENT,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_REQUIRED_BUT_NOT_ACTIVE,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_ON_SLOT1_REQUIRED_BUT_LOCKED,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_ON_SLOT1_REQUIRED_BUT_NOT_PRESENT,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_APP_ON_ANY_SLOT_REQUIRED_BUT_LOCKED,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_SUB_ON_SLOT1_EXPIRED,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_WAIT_FOR_FULL_SRV_ON_SLOT1,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_CONFIG_POLICY,
  SIMLOCK_SUBSCRIPTION_INVALID_REASON_SLOT_DISABLED
} simlock_subscription_invalid_reason_type;






typedef enum {
  SIMLOCK_UNLOCK_EVENT,
  SIMLOCK_TEMPORARY_UNLOCK_EVENT,
  SIMLOCK_DEVICE_MODE_EVENT,
  SIMLOCK_REGISTER_REMOTE_SFS_EVENT,
  SIMLOCK_LOCK_EVENT,
  SIMLOCK_DELAY_TIMER_EVENT
} simlock_event_enum_type;






typedef enum {
  SIMLOCK_REGISTER,
  SIMLOCK_DEREGISTER
} simlock_registration_enum_type;







typedef enum {
  SIMLOCK_RSU_GET_KEY_MSG,
  SIMLOCK_RSU_SET_CONFIGURATION_MSG,
  SIMLOCK_RSU_CHECK_PUBLIC_KEY_MSG,
  SIMLOCK_RSU_GENERATE_HASH_MSG,
  SIMLOCK_RSU_RETRIEVE_VERSION_MSG,
  SIMLOCK_RSU_BLOB_REQUEST_MSG,
  SIMLOCK_RSU_DELAY_TIMER_START_REQUEST_MSG,
  SIMLOCK_RSU_DELAY_TIMER_STOP_REQUEST_MSG
} simlock_rsu_message_enum_type;
# 442 "./inc/simlock_common.h"
typedef char simlock_mcc_type[3];







typedef uint8 simlock_salt_type[16];







typedef uint8 simlock_hck_type[32];







typedef uint8 simlock_rsu_device_key_type[32];







typedef char simlock_irm_type[4];







typedef uint8 simlock_modulus_type[256];







typedef uint8 simlock_exponent_type[3];







typedef struct {
  simlock_modulus_type modulus;
  simlock_exponent_type exponent;
} simlock_remote_lock_public_key_type;




typedef uint32 simlock_time_minutes_type;







typedef struct {
  uint8 mnc_len;
  char mnc_data[3];
}simlock_mnc_type;







typedef struct {
  uint8 msin_len;
  char msin_data[10];
}simlock_msin_type;







typedef struct {
  uint8 simlock_ck_length;
  char simlock_ck_data[16];
} simlock_ck_data_type;







typedef struct {
  uint32 data_len;
  uint8 * data_ptr;
} simlock_data_type;







typedef struct {
  uint8 imsi_len;
  uint8 imsi[10];
} simlock_imsi_type;







typedef struct {
  uint8 ad_len;
  uint8 ad[4];
} simlock_ad_type;







typedef struct {
  uint8 gid_len;
  uint8 gid_data[8];
} simlock_gid_type;







 typedef struct {
  boolean spn_valid;
  uint8 spn_data[16];
} simlock_spn_type;







 typedef struct {
  uint8 ehplmn_len;
  uint8 ehplmn_data[32 * 3];
} simlock_ehplmn_type;







typedef struct {
  uint8 iccid_len;
  char iccid_data[20];
} simlock_iccid_type;







typedef struct {
  uint8 impi_len;
  char impi_data[64];
} simlock_impi_type;







typedef struct {
  uint8 iccid_len;
  uint8 iccid_data[10];
} simlock_iccid_file_type;







typedef struct {
  uint8 impi_len;
  uint8 impi_data[64];
} simlock_impi_file_type;







typedef struct {
  simlock_mcc_type mcc;
  simlock_mnc_type mnc;
} simlock_nw_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  char imsi_digit6;
  char imsi_digit7;
} simlock_ns_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_gid_type gid1;
} simlock_sp_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_gid_type gid1;
  simlock_gid_type gid2;
} simlock_cp_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_msin_type imsi_msin;
} simlock_sim_code_data_type;







typedef struct {
  simlock_irm_type irm;
} simlock_nw_type2_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_spn_type spn;
} simlock_spn_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_gid_type gid1;
  simlock_nw_code_data_type ehplmn_nw_code;
} simlock_sp_ehplmn_code_data_type;







typedef struct {
  simlock_nw_code_data_type nw_code;
  simlock_iccid_type iccid;
} simlock_iccid_code_data_type;







typedef struct {
  simlock_impi_type impi;
} simlock_impi_code_data_type;







typedef struct {
  simlock_ns_code_data_type ns_code;
  simlock_gid_type gid1;
} simlock_ns_sp_code_data_type;







typedef struct {
  uint8 num_nw_codes;
  simlock_nw_code_data_type nw_code_data[20];
} simlock_nw_code_list_type;







typedef struct {
  uint8 num_ns_codes;
  simlock_ns_code_data_type ns_code_data[20];
} simlock_ns_code_list_type;







typedef struct {
  uint8 num_sp_codes;
  simlock_sp_code_data_type sp_code_data[20];
} simlock_sp_code_list_type;







typedef struct {
  uint8 num_cp_codes;
  simlock_cp_code_data_type cp_code_data[20];
} simlock_cp_code_list_type;







typedef struct {
  uint8 num_sim_codes;
  simlock_sim_code_data_type sim_code_data[20];
} simlock_sim_code_list_type;







typedef struct {
  uint8 num_nw_type2_codes;
  simlock_nw_type2_code_data_type nw_type2_code_data[20];
} simlock_nw_type2_code_list_type;







typedef struct {
  uint8 num_spn_codes;
  simlock_spn_code_data_type spn_code_data[20];
} simlock_spn_code_list_type;







typedef struct {
  uint8 num_sp_ehplmn_codes;
  simlock_sp_ehplmn_code_data_type sp_ehplmn_code_data[20];
} simlock_sp_ehplmn_code_list_type;







typedef struct {
  uint8 num_iccid_codes;
  simlock_iccid_code_data_type iccid_code_data[20];
} simlock_iccid_code_list_type;







typedef struct {
  uint8 num_impi_codes;
  simlock_impi_code_data_type impi_code_data[20];
} simlock_impi_code_list_type;







typedef struct {
  uint8 num_ns_sp_codes;
  simlock_ns_sp_code_data_type ns_sp_code_data[20];
} simlock_ns_sp_code_list_type;







typedef struct {
  simlock_category_enum_type category_type;
  union {

    simlock_nw_code_list_type nw_3gpp_code_list;
    simlock_ns_code_list_type ns_3gpp_code_list;
    simlock_sp_code_list_type sp_3gpp_code_list;
    simlock_cp_code_list_type cp_3gpp_code_list;
    simlock_spn_code_list_type spn_3gpp_code_list;
    simlock_sp_ehplmn_code_list_type sp_ehplmn_3gpp_code_list;
    simlock_iccid_code_list_type iccid_3gpp_code_list;
    simlock_impi_code_list_type impi_3gpp_code_list;
    simlock_ns_sp_code_list_type ns_sp_3gpp_code_list;
    simlock_sim_code_list_type sim_3gpp_code_list;


    simlock_nw_code_list_type nw_type1_3gpp2_code_list;
    simlock_nw_type2_code_list_type nw_type2_3gpp2_code_list;
    simlock_sim_code_list_type ruim_3gpp2_code_list;
  } code_data;
} simlock_category_data_type;







typedef struct{
  boolean slot[4];
} simlock_disabled_slot_data_type;
# 939 "./inc/simlock_common.h"
typedef struct {
  simlock_set_operation_enum_type set_operation;
  simlock_slot_policy_enum_type slot_policy;
  simlock_subscription_policy_enum_type sub_policy;
  simlock_disabled_slot_data_type disabled_slots;
} simlock_set_config_policy_msg_req_type;
# 953 "./inc/simlock_common.h"
typedef struct {
  simlock_rsu_mode_enum_type rsu_mode;
} simlock_set_rsu_mode_msg_req_type;
# 964 "./inc/simlock_common.h"
typedef struct {
  simlock_rsu_device_key_type rsu_device_key;
} simlock_set_rsu_device_key_msg_req_type;







typedef enum {
  SIMLOCK_SFS_LOCAL = 0,
  SIMLOCK_SFS_REMOTE
} simlock_sfs_enum_type;
# 986 "./inc/simlock_common.h"
typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_data_type category;
  boolean auto_lock;
  boolean blacklist;
  uint32 num_retries_max;
  uint32 iteration_cnt;
  simlock_salt_type salt;
  simlock_hck_type hck;
  boolean reuse_previous_code_list;
  simlock_sfs_enum_type sfs_type;
} simlock_set_lock_hck_msg_req_type;
# 1006 "./inc/simlock_common.h"
typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_data_type category;
  boolean auto_lock;
  boolean blacklist;
  uint32 num_retries_max;
  uint32 iteration_cnt;
  simlock_ck_data_type ck;
  boolean reuse_previous_code_list;
  simlock_sfs_enum_type sfs_type;
} simlock_set_lock_ck_msg_req_type;
# 1025 "./inc/simlock_common.h"
typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_enum_type category_type;
  simlock_ck_data_type old_ck;
  simlock_ck_data_type new_ck;
} simlock_change_ck_msg_req_type;
# 1039 "./inc/simlock_common.h"
typedef struct {
  simlock_subscription_enum_type sub_type;
  simlock_imsi_type imsi;
  simlock_ad_type ad;
  simlock_gid_type gid1;
  simlock_gid_type gid2;
  simlock_spn_type spn;
  simlock_ehplmn_type ehplmn;
  simlock_iccid_file_type iccid;
  simlock_impi_file_type impi;
  simlock_app_service_status_enum_type service_status;
} simlock_subscription_data_type;







typedef struct {
  uint8 num_subscriptions;
  boolean is_card_present;
  boolean is_gw_app_available;
  boolean is_1x_app_available;
  simlock_subscription_data_type subscription_data[4];
} simlock_card_data_type;
# 1075 "./inc/simlock_common.h"
typedef struct {
  simlock_card_data_type card_data[4];
} simlock_run_algorithm_msg_req_type;
# 1090 "./inc/simlock_common.h"
typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
  simlock_ck_data_type ck;
  boolean ignore_ck;
  boolean probe_ck;
}simlock_unlock_device_msg_req_type;
# 1105 "./inc/simlock_common.h"
typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
} simlock_get_category_data_msg_req_type;
# 1118 "./inc/simlock_common.h"
typedef struct{
  simlock_temporary_unlock_request_enum_type temporary_unlock_type;
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
  simlock_time_minutes_type duration;
}simlock_temporary_unlock_msg_req_type;
# 1132 "./inc/simlock_common.h"
typedef struct{
  simlock_device_mode_enum_type mode;
} simlock_set_device_mode_msg_req_type;







typedef struct{
  simlock_slot_enum_type slot;
  simlock_ck_data_type ck;
  boolean blacklist;
  simlock_category_data_type category;
}simlock_add_lock_codes_ck_msg_req_type;







typedef struct{
  simlock_slot_enum_type slot;
  simlock_hck_type hck;
  boolean blacklist;
  simlock_category_data_type category;
}simlock_add_lock_codes_hck_msg_req_type;







typedef struct{
  simlock_slot_enum_type slot;
  simlock_category_enum_type category_type;
  simlock_ck_data_type ck;
  simlock_sfs_enum_type sfs_type;
} simlock_relock_device_msg_req_type;







typedef struct{
  simlock_slot_enum_type slot;
  boolean blacklist;
} simlock_change_list_type_msg_req_type;







typedef struct {
  simlock_message_enum_type msg_type;
  union {
    simlock_set_config_policy_msg_req_type config_policy_msg;
    simlock_set_lock_hck_msg_req_type lock_hck_msg;
    simlock_set_lock_ck_msg_req_type lock_ck_msg;
    simlock_run_algorithm_msg_req_type algorithm_msg;
    simlock_unlock_device_msg_req_type unlock_msg;
    simlock_get_category_data_msg_req_type category_data_msg;
    simlock_temporary_unlock_msg_req_type temporary_unlock_msg;
    simlock_set_device_mode_msg_req_type device_mode_msg;
    simlock_add_lock_codes_hck_msg_req_type add_lock_codes_hck_msg;
    simlock_add_lock_codes_ck_msg_req_type add_lock_codes_ck_msg;
    simlock_relock_device_msg_req_type relock_msg;
    simlock_set_rsu_mode_msg_req_type rsu_mode_msg;
    simlock_change_ck_msg_req_type change_ck_msg;
    simlock_change_list_type_msg_req_type change_list_type_msg;
    simlock_set_rsu_device_key_msg_req_type rsu_device_key_msg;
  } message;
} simlock_message_request_data_type;
# 1220 "./inc/simlock_common.h"
typedef struct {
  uint32 duration[4][16];
} simlock_temp_unlock_remaining_time_type;
# 1231 "./inc/simlock_common.h"
typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
} simlock_unlock_device_msg_resp_type;







typedef struct {
  simlock_category_enum_type category;
  boolean category_status;
  boolean blacklist;
  uint32 num_retries_max;
  uint32 curr_retries;
  boolean category_ok_to_reactivate;
  boolean ck_present;
} simlock_category_info_type;







typedef struct {
  simlock_category_info_type category_info[16];
} simlock_lock_info_type;
# 1269 "./inc/simlock_common.h"
typedef struct {
  simlock_slot_policy_enum_type slot_policy;
  simlock_subscription_policy_enum_type subscription_policy;
  simlock_lock_info_type lock_info[4];
  simlock_temp_unlock_remaining_time_type remaining_time;
  boolean remote_simlock_storage;
  boolean emergency_only_mode;
  simlock_disabled_slot_data_type disabled_slots;
} simlock_get_status_msg_resp_type;
# 1290 "./inc/simlock_common.h"
typedef struct {
  boolean is_subscription_valid;
  simlock_category_enum_type failed_category;
  uint32 num_retries_max;
  uint32 curr_retries;
  simlock_subscription_invalid_reason_type failure_reason;
} simlock_subscription_validity_info_type;
# 1305 "./inc/simlock_common.h"
typedef struct {
  uint8 num_subscriptions;
  simlock_subscription_validity_info_type subscription_data[4];
} simlock_card_validity_data_type;
# 1317 "./inc/simlock_common.h"
typedef struct {
  simlock_card_validity_data_type card_validity_data[4];
} simlock_run_algorithm_msg_resp_type;
# 1329 "./inc/simlock_common.h"
typedef struct {
  uint8 num_of_lists;
  simlock_category_data_type * blacklist_data_ptr;
}simlock_category_data_blacklist_type;
# 1342 "./inc/simlock_common.h"
typedef struct {
  uint8 num_of_lists;
  simlock_category_data_type * whitelist_data_ptr;
}simlock_category_data_whitelist_type;







typedef struct {
  simlock_category_data_whitelist_type category_data_whitelist;
  simlock_category_data_blacklist_type category_data_blacklist;
} simlock_get_category_data_msg_resp_type;
# 1365 "./inc/simlock_common.h"
typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
} simlock_relock_device_msg_resp_type;
# 1377 "./inc/simlock_common.h"
typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
} simlock_add_lock_device_msg_resp_type;
# 1389 "./inc/simlock_common.h"
typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
} simlock_change_ck_msg_resp_type;







typedef struct {
  simlock_message_enum_type msg_type;
  union {
    simlock_get_status_msg_resp_type get_status_resp;
    simlock_run_algorithm_msg_resp_type run_algo_resp;
    simlock_unlock_device_msg_resp_type unlock_resp;
    simlock_get_category_data_msg_resp_type get_category_data_resp;
    simlock_relock_device_msg_resp_type relock_resp;
    simlock_add_lock_device_msg_resp_type add_lock_resp;
    simlock_change_ck_msg_resp_type change_ck_resp;
  } message;
} simlock_message_response_data_type;







typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
} simlock_unlock_event_type;
# 1433 "./inc/simlock_common.h"
typedef struct {
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
} simlock_generic_event_type;







typedef struct {
  uint32 num_retries_max;
  uint32 curr_retries;
  simlock_slot_enum_type slot;
  simlock_category_enum_type category;
} simlock_lock_event_type;
# 1458 "./inc/simlock_common.h"
typedef struct {
  simlock_device_mode_enum_type mode;
} simlock_device_mode_event_type;







typedef struct {

  simlock_event_enum_type evt_type;
  union{
    simlock_unlock_event_type unlock;
    simlock_generic_event_type temporary_unlock;
    simlock_device_mode_event_type device_mode;
    simlock_lock_event_type lock;
  } message;
} simlock_event_data_type;
# 1486 "./inc/simlock_common.h"
typedef struct {
  uint8 major;
  uint8 minor;
} simlock_rsu_version_type;







typedef struct {
  simlock_rsu_message_enum_type msg_type;
  union {
    simlock_data_type set_config_resp_data;
    simlock_data_type generate_hash_resp_data;
    simlock_data_type get_key_resp_data;
    simlock_rsu_version_type version;
    simlock_data_type generate_simlock_blob_resp_data;
    uint16 delay_timer_value;
  } message;
} simlock_rsu_message_response_data_type;
# 3 "ParseConfigData.h" 2
# 1 "./extra/tinyxml2/./tinyxml2.h" 1
# 37 "./extra/tinyxml2/./tinyxml2.h"
# 1 "/usr/include/c++/4.8/cctype" 1 3
# 39 "/usr/include/c++/4.8/cctype" 3
       
# 40 "/usr/include/c++/4.8/cctype" 3

# 1 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/c++config.h" 1 3
# 184 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;




}
# 426 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/c++config.h" 3
# 1 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/os_defines.h" 1 3
# 39 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/os_defines.h" 3
# 1 "/usr/include/features.h" 1 3 4
# 374 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 385 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 386 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 375 "/usr/include/features.h" 2 3 4
# 398 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 399 "/usr/include/features.h" 2 3 4
# 40 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/os_defines.h" 2 3
# 427 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/c++config.h" 2 3


# 1 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/cpu_defines.h" 1 3
# 430 "/usr/include/x86_64-linux-gnu/c++/4.8/bits/c++config.h" 2 3
# 42 "/usr/include/c++/4.8/cctype" 2 3
# 1 "/usr/include/ctype.h" 1 3 4
# 26 "/usr/include/ctype.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 27 "/usr/include/ctype.h" 2 3 4

extern "C" {
# 39 "/usr/include/ctype.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 40 "/usr/include/ctype.h" 2 3 4






enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
# 79 "/usr/include/ctype.h" 3 4
extern const unsigned short int **__ctype_b_loc (void)
     throw () __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     throw () __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     throw () __attribute__ ((__const__));
# 104 "/usr/include/ctype.h" 3 4






extern int isalnum (int) throw ();
extern int isalpha (int) throw ();
extern int iscntrl (int) throw ();
extern int isdigit (int) throw ();
extern int islower (int) throw ();
extern int isgraph (int) throw ();
extern int isprint (int) throw ();
extern int ispunct (int) throw ();
extern int isspace (int) throw ();
extern int isupper (int) throw ();
extern int isxdigit (int) throw ();



extern int tolower (int __c) throw ();


extern int toupper (int __c) throw ();








extern int isblank (int) throw ();






extern int isctype (int __c, int __mask) throw ();






extern int isascii (int __c) throw ();



extern int toascii (int __c) throw ();



extern int _toupper (int) throw ();
extern int _tolower (int) throw ();
# 257 "/usr/include/ctype.h" 3 4
# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 258 "/usr/include/ctype.h" 2 3 4
# 271 "/usr/include/ctype.h" 3 4
extern int isalnum_l (int, __locale_t) throw ();
extern int isalpha_l (int, __locale_t) throw ();
extern int iscntrl_l (int, __locale_t) throw ();
extern int isdigit_l (int, __locale_t) throw ();
extern int islower_l (int, __locale_t) throw ();
extern int isgraph_l (int, __locale_t) throw ();
extern int isprint_l (int, __locale_t) throw ();
extern int ispunct_l (int, __locale_t) throw ();
extern int isspace_l (int, __locale_t) throw ();
extern int isupper_l (int, __locale_t) throw ();
extern int isxdigit_l (int, __locale_t) throw ();

extern int isblank_l (int, __locale_t) throw ();



extern int __tolower_l (int __c, __locale_t __l) throw ();
extern int tolower_l (int __c, __locale_t __l) throw ();


extern int __toupper_l (int __c, __locale_t __l) throw ();
extern int toupper_l (int __c, __locale_t __l) throw ();
# 347 "/usr/include/ctype.h" 3 4
}
# 43 "/usr/include/c++/4.8/cctype" 2 3
# 62 "/usr/include/c++/4.8/cctype" 3
namespace std
{
  using ::isalnum;
  using ::isalpha;
  using ::iscntrl;
  using ::isdigit;
  using ::isgraph;
  using ::islower;
  using ::isprint;
  using ::ispunct;
  using ::isspace;
  using ::isupper;
  using ::isxdigit;
  using ::tolower;
  using ::toupper;
}
# 38 "./extra/tinyxml2/./tinyxml2.h" 2
# 1 "/usr/include/c++/4.8/climits" 1 3
# 39 "/usr/include/c++/4.8/climits" 3
       
# 40 "/usr/include/c++/4.8/climits" 3

# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 1 3 4
# 168 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 143 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 160 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 144 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h" 1 3 4
# 148 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 2 3 4
# 152 "/usr/include/limits.h" 2 3 4
# 169 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/syslimits.h" 2 3 4
# 35 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 2 3 4
# 42 "/usr/include/c++/4.8/climits" 2 3
# 39 "./extra/tinyxml2/./tinyxml2.h" 2
# 1 "/usr/include/c++/4.8/cstdio" 1 3
# 39 "/usr/include/c++/4.8/cstdio" 3
       
# 40 "/usr/include/c++/4.8/cstdio" 3


# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4
extern "C" {



# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 154 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 177 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 245 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 293 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 302 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};





struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 338 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);




extern "C" {


extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 434 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) throw ();
extern int _IO_ferror (_IO_FILE *__fp) throw ();

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) throw ();
extern void _IO_funlockfile (_IO_FILE *) throw ();
extern int _IO_ftrylockfile (_IO_FILE *) throw ();
# 464 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) throw ();
# 526 "/usr/include/libio.h" 3 4
}
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 90 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;






typedef __off64_t off64_t;




typedef __ssize_t ssize_t;







typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;
# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) throw ();

extern int rename (const char *__old, const char *__new) throw ();




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) throw ();








extern FILE *tmpfile (void) ;
# 205 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) throw () ;





extern char *tmpnam_r (char *__s) throw () ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 262 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);









extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4


extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) throw () ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) throw () ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  throw () ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();


extern void setlinebuf (FILE *__stream) throw ();








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) throw ();





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) throw ();





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) throw ();
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 649 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 726 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 773 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) throw ();

extern int feof (FILE *__stream) throw () ;

extern int ferror (FILE *__stream) throw () ;




extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) throw () ;




extern int fileno_unlocked (FILE *__stream) throw () ;
# 873 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) throw ();





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) throw ();



extern int ftrylockfile (FILE *__stream) throw () ;


extern void funlockfile (FILE *__stream) throw ();
# 943 "/usr/include/stdio.h" 3 4
}
# 43 "/usr/include/c++/4.8/cstdio" 2 3
# 94 "/usr/include/c++/4.8/cstdio" 3
namespace std
{
  using ::FILE;
  using ::fpos_t;

  using ::clearerr;
  using ::fclose;
  using ::feof;
  using ::ferror;
  using ::fflush;
  using ::fgetc;
  using ::fgetpos;
  using ::fgets;
  using ::fopen;
  using ::fprintf;
  using ::fputc;
  using ::fputs;
  using ::fread;
  using ::freopen;
  using ::fscanf;
  using ::fseek;
  using ::fsetpos;
  using ::ftell;
  using ::fwrite;
  using ::getc;
  using ::getchar;
  using ::gets;
  using ::perror;
  using ::printf;
  using ::putc;
  using ::putchar;
  using ::puts;
  using ::remove;
  using ::rename;
  using ::rewind;
  using ::scanf;
  using ::setbuf;
  using ::setvbuf;
  using ::sprintf;
  using ::sscanf;
  using ::tmpfile;
  using ::tmpnam;
  using ::ungetc;
  using ::vfprintf;
  using ::vprintf;
  using ::vsprintf;
}
# 150 "/usr/include/c++/4.8/cstdio" 3
namespace __gnu_cxx
{
# 168 "/usr/include/c++/4.8/cstdio" 3
  using ::snprintf;
  using ::vfscanf;
  using ::vscanf;
  using ::vsnprintf;
  using ::vsscanf;

}

namespace std
{
  using ::__gnu_cxx::snprintf;
  using ::__gnu_cxx::vfscanf;
  using ::__gnu_cxx::vscanf;
  using ::__gnu_cxx::vsnprintf;
  using ::__gnu_cxx::vsscanf;
}
# 40 "./extra/tinyxml2/./tinyxml2.h" 2
# 1 "/usr/include/c++/4.8/cstdlib" 1 3
# 39 "/usr/include/c++/4.8/cstdlib" 3
       
# 40 "/usr/include/c++/4.8/cstdlib" 3
# 72 "/usr/include/c++/4.8/cstdlib" 3
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 33 "/usr/include/stdlib.h" 2 3 4

extern "C" {






# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 66 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) throw () ;




extern double atof (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) throw () __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

# 239 "/usr/include/stdlib.h" 3 4
extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) throw () __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));
# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) throw () ;


extern long int a64l (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
extern "C" {





typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;
# 115 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
# 44 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4
# 54 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern "C" {
# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
}
# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4
extern "C" {

__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     throw () __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     throw () __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     throw () __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4
}
# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 262 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 124 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 211 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


}
# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) throw ();


extern void srandom (unsigned int __seed) throw ();





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) throw () __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) throw () __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     throw () __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) throw ();

extern void srand (unsigned int __seed) throw ();




extern int rand_r (unsigned int *__seed) throw ();







extern double drand48 (void) throw ();
extern double erand48 (unsigned short int __xsubi[3]) throw () __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) throw ();
extern long int nrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) throw ();
extern long int jrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) throw ();
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     throw () __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) throw () __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) throw () __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     throw () __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     throw () __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) throw ();




extern void cfree (void *__ptr) throw ();



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4

extern "C" {





extern void *alloca (size_t __size) throw ();





}
# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) throw () __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     throw () __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) throw () __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) throw () __attribute__ ((__nonnull__ (1)));




extern "C++" int at_quick_exit (void (*__func) (void))
     throw () __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));









extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     throw () __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) throw () __attribute__ ((__noreturn__));





extern void quick_exit (int __status) throw () __attribute__ ((__noreturn__));







extern void _Exit (int __status) throw () __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) throw () __attribute__ ((__nonnull__ (1))) ;





extern char *secure_getenv (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int putenv (char *__string) throw () __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     throw () __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) throw () __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) throw ();
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) throw () __attribute__ ((__nonnull__ (1)));
# 620 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 630 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 642 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 652 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
# 674 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 684 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 694 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 706 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;









extern int system (const char *__command) ;






extern char *canonicalize_file_name (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) throw () ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);





extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) throw () __attribute__ ((__const__)) ;
extern long int labs (long int __x) throw () __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     throw () __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     throw () __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     throw () __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     throw () __attribute__ ((__const__)) ;

# 812 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) throw ();


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) throw ();


extern int wctomb (char *__s, wchar_t __wchar) throw ();



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) throw ();

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     throw ();








extern int rpmatch (const char *__response) throw () __attribute__ ((__nonnull__ (1))) ;
# 899 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     throw () __attribute__ ((__nonnull__ (1, 2, 3))) ;





extern void setkey (const char *__key) throw () __attribute__ ((__nonnull__ (1)));







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) throw ();



extern int unlockpt (int __fd) throw ();




extern char *ptsname (int __fd) throw () ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     throw () __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 956 "/usr/include/stdlib.h" 2 3 4
# 968 "/usr/include/stdlib.h" 3 4
}
# 73 "/usr/include/c++/4.8/cstdlib" 2 3
# 114 "/usr/include/c++/4.8/cstdlib" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::div_t;
  using ::ldiv_t;

  using ::abort;
  using ::abs;
  using ::atexit;





  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;

  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;

  using ::qsort;





  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;

  using ::wcstombs;
  using ::wctomb;



  inline long
  abs(long __i) { return __builtin_labs(__i); }

  inline ldiv_t
  div(long __i, long __j) { return ldiv(__i, __j); }



  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }



  inline __int128
  abs(__int128 __x) { return __x >= 0 ? __x : -__x; }



}
# 196 "/usr/include/c++/4.8/cstdlib" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  using ::lldiv_t;





  using ::_Exit;



  using ::llabs;

  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }

  using ::lldiv;
# 228 "/usr/include/c++/4.8/cstdlib" 3
  using ::atoll;
  using ::strtoll;
  using ::strtoull;

  using ::strtof;
  using ::strtold;


}

namespace std
{

  using ::__gnu_cxx::lldiv_t;

  using ::__gnu_cxx::_Exit;

  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;

  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}
# 41 "./extra/tinyxml2/./tinyxml2.h" 2
# 1 "/usr/include/c++/4.8/cstring" 1 3
# 39 "/usr/include/c++/4.8/cstring" 3
       
# 40 "/usr/include/c++/4.8/cstring" 3


# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4
extern "C" {




# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4
# 44 "/usr/include/string.h" 3 4


extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const void *memchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 94 "/usr/include/string.h" 3 4
}










extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *rawmemchr (const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));







extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *memrchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));

# 166 "/usr/include/string.h" 3 4
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 211 "/usr/include/string.h" 3 4



extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strchr (const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 234 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strrchr (const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 261 "/usr/include/string.h" 3 4
}










extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const char *strchrnul (const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern size_t strcspn (const char *__s, const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern "C++"
{
extern char *strpbrk (char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strpbrk (const char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 313 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strstr (char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strstr (const char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 340 "/usr/include/string.h" 3 4
}







extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));





extern "C++" char *strcasestr (char *__haystack, const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" const char *strcasestr (const char *__haystack,
         const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 382 "/usr/include/string.h" 3 4
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) throw ();

# 438 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;





extern char *strerror_l (int __errnum, __locale_t __l) throw ();





extern void __bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern char *index (char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *index (const char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 487 "/usr/include/string.h" 3 4
}







extern "C++"
{
extern char *rindex (char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *rindex (const char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 515 "/usr/include/string.h" 3 4
}







extern int ffs (int __i) throw () __attribute__ ((__const__));




extern int ffsl (long int __l) throw () __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (const char *__s1, const char *__s2,
    __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) throw ();


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));







extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" const char *basename (const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
# 644 "/usr/include/string.h" 3 4
}
# 43 "/usr/include/c++/4.8/cstring" 2 3
# 71 "/usr/include/c++/4.8/cstring" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::memchr;
  using ::memcmp;
  using ::memcpy;
  using ::memmove;
  using ::memset;
  using ::strcat;
  using ::strcmp;
  using ::strcoll;
  using ::strcpy;
  using ::strcspn;
  using ::strerror;
  using ::strlen;
  using ::strncat;
  using ::strncmp;
  using ::strncpy;
  using ::strspn;
  using ::strtok;
  using ::strxfrm;
  using ::strchr;
  using ::strpbrk;
  using ::strrchr;
  using ::strstr;
# 120 "/usr/include/c++/4.8/cstring" 3

}
# 42 "./extra/tinyxml2/./tinyxml2.h" 2

# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 48 "/usr/include/stdint.h" 3 4
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 65 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 90 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 103 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 119 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 134 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 2 3 4
# 44 "./extra/tinyxml2/./tinyxml2.h" 2
# 101 "./extra/tinyxml2/./tinyxml2.h"
static const int TIXML2_MAJOR_VERSION = 7;
static const int TIXML2_MINOR_VERSION = 0;
static const int TIXML2_PATCH_VERSION = 1;
# 114 "./extra/tinyxml2/./tinyxml2.h"
static const int TINYXML2_MAX_ELEMENT_DEPTH = 100;

namespace tinyxml2
{
class XMLDocument;
class XMLElement;
class XMLAttribute;
class XMLComment;
class XMLText;
class XMLDeclaration;
class XMLUnknown;
class XMLPrinter;
# 135 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) StrPair
{
public:
    enum {
        NEEDS_ENTITY_PROCESSING = 0x01,
        NEEDS_NEWLINE_NORMALIZATION = 0x02,
        NEEDS_WHITESPACE_COLLAPSING = 0x04,

        TEXT_ELEMENT = NEEDS_ENTITY_PROCESSING | NEEDS_NEWLINE_NORMALIZATION,
        TEXT_ELEMENT_LEAVE_ENTITIES = NEEDS_NEWLINE_NORMALIZATION,
        ATTRIBUTE_NAME = 0,
        ATTRIBUTE_VALUE = NEEDS_ENTITY_PROCESSING | NEEDS_NEWLINE_NORMALIZATION,
        ATTRIBUTE_VALUE_LEAVE_ENTITIES = NEEDS_NEWLINE_NORMALIZATION,
        COMMENT = NEEDS_NEWLINE_NORMALIZATION
    };

    StrPair() : _flags( 0 ), _start( 0 ), _end( 0 ) {}
    ~StrPair();

    void Set( char* start, char* end, int flags ) {
        {};
        {};
        Reset();
        _start = start;
        _end = end;
        _flags = flags | NEEDS_FLUSH;
    }

    const char* GetStr();

    bool Empty() const {
        return _start == _end;
    }

    void SetInternedStr( const char* str ) {
        Reset();
        _start = const_cast<char*>(str);
    }

    void SetStr( const char* str, int flags=0 );

    char* ParseText( char* in, const char* endTag, int strFlags, int* curLineNumPtr );
    char* ParseName( char* in );

    void TransferTo( StrPair* other );
 void Reset();

private:
    void CollapseWhitespace();

    enum {
        NEEDS_FLUSH = 0x100,
        NEEDS_DELETE = 0x200
    };

    int _flags;
    char* _start;
    char* _end;

    StrPair( const StrPair& other );
    void operator=( const StrPair& other );
};







template <class T, int INITIAL_SIZE>
class DynArray
{
public:
    DynArray() :
        _mem( _pool ),
        _allocated( INITIAL_SIZE ),
        _size( 0 )
    {
    }

    ~DynArray() {
        if ( _mem != _pool ) {
            delete [] _mem;
        }
    }

    void Clear() {
        _size = 0;
    }

    void Push( T t ) {
        {};
        EnsureCapacity( _size+1 );
        _mem[_size] = t;
        ++_size;
    }

    T* PushArr( int count ) {
        {};
        {};
        EnsureCapacity( _size+count );
        T* ret = &_mem[_size];
        _size += count;
        return ret;
    }

    T Pop() {
        {};
        --_size;
        return _mem[_size];
    }

    void PopArr( int count ) {
        {};
        _size -= count;
    }

    bool Empty() const {
        return _size == 0;
    }

    T& operator[](int i) {
        {};
        return _mem[i];
    }

    const T& operator[](int i) const {
        {};
        return _mem[i];
    }

    const T& PeekTop() const {
        {};
        return _mem[ _size - 1];
    }

    int Size() const {
        {};
        return _size;
    }

    int Capacity() const {
        {};
        return _allocated;
    }

 void SwapRemove(int i) {
  {};
  {};
  _mem[i] = _mem[_size - 1];
  --_size;
 }

    const T* Mem() const {
        {};
        return _mem;
    }

    T* Mem() {
        {};
        return _mem;
    }

private:
    DynArray( const DynArray& );
    void operator=( const DynArray& );

    void EnsureCapacity( int cap ) {
        {};
        if ( cap > _allocated ) {
            {};
            const int newAllocated = cap * 2;
            T* newMem = new T[newAllocated];
            {};
            memcpy( newMem, _mem, sizeof(T)*_size );
            if ( _mem != _pool ) {
                delete [] _mem;
            }
            _mem = newMem;
            _allocated = newAllocated;
        }
    }

    T* _mem;
    T _pool[INITIAL_SIZE];
    int _allocated;
    int _size;
};






class MemPool
{
public:
    MemPool() {}
    virtual ~MemPool() {}

    virtual int ItemSize() const = 0;
    virtual void* Alloc() = 0;
    virtual void Free( void* ) = 0;
    virtual void SetTracked() = 0;
};





template< int ITEM_SIZE >
class MemPoolT : public MemPool
{
public:
    MemPoolT() : _blockPtrs(), _root(0), _currentAllocs(0), _nAllocs(0), _maxAllocs(0), _nUntracked(0) {}
    ~MemPoolT() {
        MemPoolT< ITEM_SIZE >::Clear();
    }

    void Clear() {

        while( !_blockPtrs.Empty()) {
            Block* lastBlock = _blockPtrs.Pop();
            delete lastBlock;
        }
        _root = 0;
        _currentAllocs = 0;
        _nAllocs = 0;
        _maxAllocs = 0;
        _nUntracked = 0;
    }

    virtual int ItemSize() const {
        return ITEM_SIZE;
    }
    int CurrentAllocs() const {
        return _currentAllocs;
    }

    virtual void* Alloc() {
        if ( !_root ) {

            Block* block = new Block();
            _blockPtrs.Push( block );

            Item* blockItems = block->items;
            for( int i = 0; i < ITEMS_PER_BLOCK - 1; ++i ) {
                blockItems[i].next = &(blockItems[i + 1]);
            }
            blockItems[ITEMS_PER_BLOCK - 1].next = 0;
            _root = blockItems;
        }
        Item* const result = _root;
        {};
        _root = _root->next;

        ++_currentAllocs;
        if ( _currentAllocs > _maxAllocs ) {
            _maxAllocs = _currentAllocs;
        }
        ++_nAllocs;
        ++_nUntracked;
        return result;
    }

    virtual void Free( void* mem ) {
        if ( !mem ) {
            return;
        }
        --_currentAllocs;
        Item* item = static_cast<Item*>( mem );



        item->next = _root;
        _root = item;
    }
    void Trace( const char* name ) {
        printf( "Mempool %s watermark=%d [%dk] current=%d size=%d nAlloc=%d blocks=%d\n",
                name, _maxAllocs, _maxAllocs * ITEM_SIZE / 1024, _currentAllocs,
                ITEM_SIZE, _nAllocs, _blockPtrs.Size() );
    }

    void SetTracked() {
        --_nUntracked;
    }

    int Untracked() const {
        return _nUntracked;
    }
# 437 "./extra/tinyxml2/./tinyxml2.h"
    enum { ITEMS_PER_BLOCK = (4 * 1024) / ITEM_SIZE };

private:
    MemPoolT( const MemPoolT& );
    void operator=( const MemPoolT& );

    union Item {
        Item* next;
        char itemData[ITEM_SIZE];
    };
    struct Block {
        Item items[ITEMS_PER_BLOCK];
    };
    DynArray< Block*, 10 > _blockPtrs;
    Item* _root;

    int _currentAllocs;
    int _nAllocs;
    int _maxAllocs;
    int _nUntracked;
};
# 480 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLVisitor
{
public:
    virtual ~XMLVisitor() {}


    virtual bool VisitEnter( const XMLDocument& ) {
        return true;
    }

    virtual bool VisitExit( const XMLDocument& ) {
        return true;
    }


    virtual bool VisitEnter( const XMLElement& , const XMLAttribute* ) {
        return true;
    }

    virtual bool VisitExit( const XMLElement& ) {
        return true;
    }


    virtual bool Visit( const XMLDeclaration& ) {
        return true;
    }

    virtual bool Visit( const XMLText& ) {
        return true;
    }

    virtual bool Visit( const XMLComment& ) {
        return true;
    }

    virtual bool Visit( const XMLUnknown& ) {
        return true;
    }
};


enum XMLError {
    XML_SUCCESS = 0,
    XML_NO_ATTRIBUTE,
    XML_WRONG_ATTRIBUTE_TYPE,
    XML_ERROR_FILE_NOT_FOUND,
    XML_ERROR_FILE_COULD_NOT_BE_OPENED,
    XML_ERROR_FILE_READ_ERROR,
    XML_ERROR_PARSING_ELEMENT,
    XML_ERROR_PARSING_ATTRIBUTE,
    XML_ERROR_PARSING_TEXT,
    XML_ERROR_PARSING_CDATA,
    XML_ERROR_PARSING_COMMENT,
    XML_ERROR_PARSING_DECLARATION,
    XML_ERROR_PARSING_UNKNOWN,
    XML_ERROR_EMPTY_DOCUMENT,
    XML_ERROR_MISMATCHED_ELEMENT,
    XML_ERROR_PARSING,
    XML_CAN_NOT_CONVERT_TEXT,
    XML_NO_TEXT_NODE,
 XML_ELEMENT_DEPTH_EXCEEDED,

 XML_ERROR_COUNT
};





class __attribute__((visibility("default"))) XMLUtil
{
public:
    static const char* SkipWhiteSpace( const char* p, int* curLineNumPtr ) {
        {};

        while( IsWhiteSpace(*p) ) {
            if (curLineNumPtr && *p == '\n') {
                ++(*curLineNumPtr);
            }
            ++p;
        }
        {};
        return p;
    }
    static char* SkipWhiteSpace( char* p, int* curLineNumPtr ) {
        return const_cast<char*>( SkipWhiteSpace( const_cast<const char*>(p), curLineNumPtr ) );
    }



    static bool IsWhiteSpace( char p ) {
        return !IsUTF8Continuation(p) && isspace( static_cast<unsigned char>(p) );
    }

    inline static bool IsNameStartChar( unsigned char ch ) {
        if ( ch >= 128 ) {

            return true;
        }
        if ( isalpha( ch ) ) {
            return true;
        }
        return ch == ':' || ch == '_';
    }

    inline static bool IsNameChar( unsigned char ch ) {
        return IsNameStartChar( ch )
               || isdigit( ch )
               || ch == '.'
               || ch == '-';
    }

    inline static bool StringEqual( const char* p, const char* q, int nChar=2147483647 ) {
        if ( p == q ) {
            return true;
        }
        {};
        {};
        {};
        return strncmp( p, q, nChar ) == 0;
    }

    inline static bool IsUTF8Continuation( char p ) {
        return ( p & 0x80 ) != 0;
    }

    static const char* ReadBOM( const char* p, bool* hasBOM );


    static const char* GetCharacterRef( const char* p, char* value, int* length );
    static void ConvertUTF32ToUTF8( unsigned long input, char* output, int* length );


    static void ToStr( int v, char* buffer, int bufferSize );
    static void ToStr( unsigned v, char* buffer, int bufferSize );
    static void ToStr( bool v, char* buffer, int bufferSize );
    static void ToStr( float v, char* buffer, int bufferSize );
    static void ToStr( double v, char* buffer, int bufferSize );
 static void ToStr(int64_t v, char* buffer, int bufferSize);


    static bool ToInt( const char* str, int* value );
    static bool ToUnsigned( const char* str, unsigned* value );
    static bool ToBool( const char* str, bool* value );
    static bool ToFloat( const char* str, float* value );
    static bool ToDouble( const char* str, double* value );
 static bool ToInt64(const char* str, int64_t* value);






 static void SetBoolSerialization(const char* writeTrue, const char* writeFalse);

private:
 static const char* writeBoolTrue;
 static const char* writeBoolFalse;
};
# 667 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLNode
{
    friend class XMLDocument;
    friend class XMLElement;
public:


    const XMLDocument* GetDocument() const {
        {};
        return _document;
    }

    XMLDocument* GetDocument() {
        {};
        return _document;
    }


    virtual XMLElement* ToElement() {
        return 0;
    }

    virtual XMLText* ToText() {
        return 0;
    }

    virtual XMLComment* ToComment() {
        return 0;
    }

    virtual XMLDocument* ToDocument() {
        return 0;
    }

    virtual XMLDeclaration* ToDeclaration() {
        return 0;
    }

    virtual XMLUnknown* ToUnknown() {
        return 0;
    }

    virtual const XMLElement* ToElement() const {
        return 0;
    }
    virtual const XMLText* ToText() const {
        return 0;
    }
    virtual const XMLComment* ToComment() const {
        return 0;
    }
    virtual const XMLDocument* ToDocument() const {
        return 0;
    }
    virtual const XMLDeclaration* ToDeclaration() const {
        return 0;
    }
    virtual const XMLUnknown* ToUnknown() const {
        return 0;
    }
# 737 "./extra/tinyxml2/./tinyxml2.h"
    const char* Value() const;




    void SetValue( const char* val, bool staticMem=false );


    int GetLineNum() const { return _parseLineNum; }


    const XMLNode* Parent() const {
        return _parent;
    }

    XMLNode* Parent() {
        return _parent;
    }


    bool NoChildren() const {
        return !_firstChild;
    }


    const XMLNode* FirstChild() const {
        return _firstChild;
    }

    XMLNode* FirstChild() {
        return _firstChild;
    }




    const XMLElement* FirstChildElement( const char* name = 0 ) const;

    XMLElement* FirstChildElement( const char* name = 0 ) {
        return const_cast<XMLElement*>(const_cast<const XMLNode*>(this)->FirstChildElement( name ));
    }


    const XMLNode* LastChild() const {
        return _lastChild;
    }

    XMLNode* LastChild() {
        return _lastChild;
    }




    const XMLElement* LastChildElement( const char* name = 0 ) const;

    XMLElement* LastChildElement( const char* name = 0 ) {
        return const_cast<XMLElement*>(const_cast<const XMLNode*>(this)->LastChildElement(name) );
    }


    const XMLNode* PreviousSibling() const {
        return _prev;
    }

    XMLNode* PreviousSibling() {
        return _prev;
    }


    const XMLElement* PreviousSiblingElement( const char* name = 0 ) const ;

    XMLElement* PreviousSiblingElement( const char* name = 0 ) {
        return const_cast<XMLElement*>(const_cast<const XMLNode*>(this)->PreviousSiblingElement( name ) );
    }


    const XMLNode* NextSibling() const {
        return _next;
    }

    XMLNode* NextSibling() {
        return _next;
    }


    const XMLElement* NextSiblingElement( const char* name = 0 ) const;

    XMLElement* NextSiblingElement( const char* name = 0 ) {
        return const_cast<XMLElement*>(const_cast<const XMLNode*>(this)->NextSiblingElement( name ) );
    }
# 836 "./extra/tinyxml2/./tinyxml2.h"
    XMLNode* InsertEndChild( XMLNode* addThis );

    XMLNode* LinkEndChild( XMLNode* addThis ) {
        return InsertEndChild( addThis );
    }







    XMLNode* InsertFirstChild( XMLNode* addThis );
# 857 "./extra/tinyxml2/./tinyxml2.h"
    XMLNode* InsertAfterChild( XMLNode* afterThis, XMLNode* addThis );




    void DeleteChildren();




    void DeleteChild( XMLNode* node );
# 878 "./extra/tinyxml2/./tinyxml2.h"
    virtual XMLNode* ShallowClone( XMLDocument* document ) const = 0;
# 893 "./extra/tinyxml2/./tinyxml2.h"
 XMLNode* DeepClone( XMLDocument* target ) const;







    virtual bool ShallowEqual( const XMLNode* compare ) const = 0;
# 925 "./extra/tinyxml2/./tinyxml2.h"
    virtual bool Accept( XMLVisitor* visitor ) const = 0;






 void SetUserData(void* userData) { _userData = userData; }






 void* GetUserData() const { return _userData; }

protected:
    explicit XMLNode( XMLDocument* );
    virtual ~XMLNode();

    virtual char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr);

    XMLDocument* _document;
    XMLNode* _parent;
    mutable StrPair _value;
    int _parseLineNum;

    XMLNode* _firstChild;
    XMLNode* _lastChild;

    XMLNode* _prev;
    XMLNode* _next;

 void* _userData;

private:
    MemPool* _memPool;
    void Unlink( XMLNode* child );
    static void DeleteNode( XMLNode* node );
    void InsertChildPreamble( XMLNode* insertThis ) const;
    const XMLElement* ToElementWithName( const char* name ) const;

    XMLNode( const XMLNode& );
    XMLNode& operator=( const XMLNode& );
};
# 984 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLText : public XMLNode
{
    friend class XMLDocument;
public:
    virtual bool Accept( XMLVisitor* visitor ) const;

    virtual XMLText* ToText() {
        return this;
    }
    virtual const XMLText* ToText() const {
        return this;
    }


    void SetCData( bool isCData ) {
        _isCData = isCData;
    }

    bool CData() const {
        return _isCData;
    }

    virtual XMLNode* ShallowClone( XMLDocument* document ) const;
    virtual bool ShallowEqual( const XMLNode* compare ) const;

protected:
    explicit XMLText( XMLDocument* doc ) : XMLNode( doc ), _isCData( false ) {}
    virtual ~XMLText() {}

    char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr );

private:
    bool _isCData;

    XMLText( const XMLText& );
    XMLText& operator=( const XMLText& );
};



class __attribute__((visibility("default"))) XMLComment : public XMLNode
{
    friend class XMLDocument;
public:
    virtual XMLComment* ToComment() {
        return this;
    }
    virtual const XMLComment* ToComment() const {
        return this;
    }

    virtual bool Accept( XMLVisitor* visitor ) const;

    virtual XMLNode* ShallowClone( XMLDocument* document ) const;
    virtual bool ShallowEqual( const XMLNode* compare ) const;

protected:
    explicit XMLComment( XMLDocument* doc );
    virtual ~XMLComment();

    char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr);

private:
    XMLComment( const XMLComment& );
    XMLComment& operator=( const XMLComment& );
};
# 1063 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLDeclaration : public XMLNode
{
    friend class XMLDocument;
public:
    virtual XMLDeclaration* ToDeclaration() {
        return this;
    }
    virtual const XMLDeclaration* ToDeclaration() const {
        return this;
    }

    virtual bool Accept( XMLVisitor* visitor ) const;

    virtual XMLNode* ShallowClone( XMLDocument* document ) const;
    virtual bool ShallowEqual( const XMLNode* compare ) const;

protected:
    explicit XMLDeclaration( XMLDocument* doc );
    virtual ~XMLDeclaration();

    char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr );

private:
    XMLDeclaration( const XMLDeclaration& );
    XMLDeclaration& operator=( const XMLDeclaration& );
};
# 1098 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLUnknown : public XMLNode
{
    friend class XMLDocument;
public:
    virtual XMLUnknown* ToUnknown() {
        return this;
    }
    virtual const XMLUnknown* ToUnknown() const {
        return this;
    }

    virtual bool Accept( XMLVisitor* visitor ) const;

    virtual XMLNode* ShallowClone( XMLDocument* document ) const;
    virtual bool ShallowEqual( const XMLNode* compare ) const;

protected:
    explicit XMLUnknown( XMLDocument* doc );
    virtual ~XMLUnknown();

    char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr );

private:
    XMLUnknown( const XMLUnknown& );
    XMLUnknown& operator=( const XMLUnknown& );
};
# 1133 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLAttribute
{
    friend class XMLElement;
public:

    const char* Name() const;


    const char* Value() const;


    int GetLineNum() const { return _parseLineNum; }


    const XMLAttribute* Next() const {
        return _next;
    }





 int IntValue() const {
  int i = 0;
  QueryIntValue(&i);
  return i;
 }

 int64_t Int64Value() const {
  int64_t i = 0;
  QueryInt64Value(&i);
  return i;
 }


    unsigned UnsignedValue() const {
        unsigned i=0;
        QueryUnsignedValue( &i );
        return i;
    }

    bool BoolValue() const {
        bool b=false;
        QueryBoolValue( &b );
        return b;
    }

    double DoubleValue() const {
        double d=0;
        QueryDoubleValue( &d );
        return d;
    }

    float FloatValue() const {
        float f=0;
        QueryFloatValue( &f );
        return f;
    }





    XMLError QueryIntValue( int* value ) const;

    XMLError QueryUnsignedValue( unsigned int* value ) const;

 XMLError QueryInt64Value(int64_t* value) const;

    XMLError QueryBoolValue( bool* value ) const;

    XMLError QueryDoubleValue( double* value ) const;

    XMLError QueryFloatValue( float* value ) const;


    void SetAttribute( const char* value );

    void SetAttribute( int value );

    void SetAttribute( unsigned value );

 void SetAttribute(int64_t value);

    void SetAttribute( bool value );

    void SetAttribute( double value );

    void SetAttribute( float value );

private:
    enum { BUF_SIZE = 200 };

    XMLAttribute() : _name(), _value(),_parseLineNum( 0 ), _next( 0 ), _memPool( 0 ) {}
    virtual ~XMLAttribute() {}

    XMLAttribute( const XMLAttribute& );
    void operator=( const XMLAttribute& );
    void SetName( const char* name );

    char* ParseDeep( char* p, bool processEntities, int* curLineNumPtr );

    mutable StrPair _name;
    mutable StrPair _value;
    int _parseLineNum;
    XMLAttribute* _next;
    MemPool* _memPool;
};






class __attribute__((visibility("default"))) XMLElement : public XMLNode
{
    friend class XMLDocument;
public:

    const char* Name() const {
        return Value();
    }

    void SetName( const char* str, bool staticMem=false ) {
        SetValue( str, staticMem );
    }

    virtual XMLElement* ToElement() {
        return this;
    }
    virtual const XMLElement* ToElement() const {
        return this;
    }
    virtual bool Accept( XMLVisitor* visitor ) const;
# 1291 "./extra/tinyxml2/./tinyxml2.h"
    const char* Attribute( const char* name, const char* value=0 ) const;







 int IntAttribute(const char* name, int defaultValue = 0) const;

 unsigned UnsignedAttribute(const char* name, unsigned defaultValue = 0) const;

 int64_t Int64Attribute(const char* name, int64_t defaultValue = 0) const;

 bool BoolAttribute(const char* name, bool defaultValue = false) const;

 double DoubleAttribute(const char* name, double defaultValue = 0) const;

 float FloatAttribute(const char* name, float defaultValue = 0) const;
# 1324 "./extra/tinyxml2/./tinyxml2.h"
    XMLError QueryIntAttribute( const char* name, int* value ) const {
        const XMLAttribute* a = FindAttribute( name );
        if ( !a ) {
            return XML_NO_ATTRIBUTE;
        }
        return a->QueryIntValue( value );
    }


    XMLError QueryUnsignedAttribute( const char* name, unsigned int* value ) const {
        const XMLAttribute* a = FindAttribute( name );
        if ( !a ) {
            return XML_NO_ATTRIBUTE;
        }
        return a->QueryUnsignedValue( value );
    }


 XMLError QueryInt64Attribute(const char* name, int64_t* value) const {
  const XMLAttribute* a = FindAttribute(name);
  if (!a) {
   return XML_NO_ATTRIBUTE;
  }
  return a->QueryInt64Value(value);
 }


    XMLError QueryBoolAttribute( const char* name, bool* value ) const {
        const XMLAttribute* a = FindAttribute( name );
        if ( !a ) {
            return XML_NO_ATTRIBUTE;
        }
        return a->QueryBoolValue( value );
    }

    XMLError QueryDoubleAttribute( const char* name, double* value ) const {
        const XMLAttribute* a = FindAttribute( name );
        if ( !a ) {
            return XML_NO_ATTRIBUTE;
        }
        return a->QueryDoubleValue( value );
    }

    XMLError QueryFloatAttribute( const char* name, float* value ) const {
        const XMLAttribute* a = FindAttribute( name );
        if ( !a ) {
            return XML_NO_ATTRIBUTE;
        }
        return a->QueryFloatValue( value );
    }


 XMLError QueryStringAttribute(const char* name, const char** value) const {
  const XMLAttribute* a = FindAttribute(name);
  if (!a) {
   return XML_NO_ATTRIBUTE;
  }
  *value = a->Value();
  return XML_SUCCESS;
 }
# 1404 "./extra/tinyxml2/./tinyxml2.h"
 XMLError QueryAttribute( const char* name, int* value ) const {
  return QueryIntAttribute( name, value );
 }

 XMLError QueryAttribute( const char* name, unsigned int* value ) const {
  return QueryUnsignedAttribute( name, value );
 }

 XMLError QueryAttribute(const char* name, int64_t* value) const {
  return QueryInt64Attribute(name, value);
 }

 XMLError QueryAttribute( const char* name, bool* value ) const {
  return QueryBoolAttribute( name, value );
 }

 XMLError QueryAttribute( const char* name, double* value ) const {
  return QueryDoubleAttribute( name, value );
 }

 XMLError QueryAttribute( const char* name, float* value ) const {
  return QueryFloatAttribute( name, value );
 }


    void SetAttribute( const char* name, const char* value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }

    void SetAttribute( const char* name, int value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }

    void SetAttribute( const char* name, unsigned value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }


 void SetAttribute(const char* name, int64_t value) {
  XMLAttribute* a = FindOrCreateAttribute(name);
  a->SetAttribute(value);
 }


    void SetAttribute( const char* name, bool value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }

    void SetAttribute( const char* name, double value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }

    void SetAttribute( const char* name, float value ) {
        XMLAttribute* a = FindOrCreateAttribute( name );
        a->SetAttribute( value );
    }




    void DeleteAttribute( const char* name );


    const XMLAttribute* FirstAttribute() const {
        return _rootAttribute;
    }

    const XMLAttribute* FindAttribute( const char* name ) const;
# 1506 "./extra/tinyxml2/./tinyxml2.h"
    const char* GetText() const;
# 1542 "./extra/tinyxml2/./tinyxml2.h"
 void SetText( const char* inText );

    void SetText( int value );

    void SetText( unsigned value );

 void SetText(int64_t value);

    void SetText( bool value );

    void SetText( double value );

    void SetText( float value );
# 1582 "./extra/tinyxml2/./tinyxml2.h"
    XMLError QueryIntText( int* ival ) const;

    XMLError QueryUnsignedText( unsigned* uval ) const;

 XMLError QueryInt64Text(int64_t* uval) const;

    XMLError QueryBoolText( bool* bval ) const;

    XMLError QueryDoubleText( double* dval ) const;

    XMLError QueryFloatText( float* fval ) const;

 int IntText(int defaultValue = 0) const;


 unsigned UnsignedText(unsigned defaultValue = 0) const;

 int64_t Int64Text(int64_t defaultValue = 0) const;

 bool BoolText(bool defaultValue = false) const;

 double DoubleText(double defaultValue = 0) const;

 float FloatText(float defaultValue = 0) const;


    enum ElementClosingType {
        OPEN,
        CLOSED,
        CLOSING
    };
    ElementClosingType ClosingType() const {
        return _closingType;
    }
    virtual XMLNode* ShallowClone( XMLDocument* document ) const;
    virtual bool ShallowEqual( const XMLNode* compare ) const;

protected:
    char* ParseDeep( char* p, StrPair* parentEndTag, int* curLineNumPtr );

private:
    XMLElement( XMLDocument* doc );
    virtual ~XMLElement();
    XMLElement( const XMLElement& );
    void operator=( const XMLElement& );

    XMLAttribute* FindOrCreateAttribute( const char* name );
    char* ParseAttributes( char* p, int* curLineNumPtr );
    static void DeleteAttribute( XMLAttribute* attribute );
    XMLAttribute* CreateAttribute();

    enum { BUF_SIZE = 200 };
    ElementClosingType _closingType;



    XMLAttribute* _rootAttribute;
};


enum Whitespace {
    PRESERVE_WHITESPACE,
    COLLAPSE_WHITESPACE
};







class __attribute__((visibility("default"))) XMLDocument : public XMLNode
{
    friend class XMLElement;


    friend class XMLNode;
    friend class XMLText;
    friend class XMLComment;
    friend class XMLDeclaration;
    friend class XMLUnknown;
public:

    XMLDocument( bool processEntities = true, Whitespace whitespaceMode = PRESERVE_WHITESPACE );
    ~XMLDocument();

    virtual XMLDocument* ToDocument() {
        {};
        return this;
    }
    virtual const XMLDocument* ToDocument() const {
        {};
        return this;
    }
# 1687 "./extra/tinyxml2/./tinyxml2.h"
    XMLError Parse( const char* xml, size_t nBytes=(size_t)(-1) );






    XMLError LoadFile( const char* filename );
# 1707 "./extra/tinyxml2/./tinyxml2.h"
    XMLError LoadFile( FILE* );






    XMLError SaveFile( const char* filename, bool compact = false );
# 1723 "./extra/tinyxml2/./tinyxml2.h"
    XMLError SaveFile( FILE* fp, bool compact = false );

    bool ProcessEntities() const {
        return _processEntities;
    }
    Whitespace WhitespaceMode() const {
        return _whitespaceMode;
    }




    bool HasBOM() const {
        return _writeBOM;
    }


    void SetBOM( bool useBOM ) {
        _writeBOM = useBOM;
    }




    XMLElement* RootElement() {
        return FirstChildElement();
    }
    const XMLElement* RootElement() const {
        return FirstChildElement();
    }
# 1768 "./extra/tinyxml2/./tinyxml2.h"
    void Print( XMLPrinter* streamer=0 ) const;
    virtual bool Accept( XMLVisitor* visitor ) const;






    XMLElement* NewElement( const char* name );





    XMLComment* NewComment( const char* comment );





    XMLText* NewText( const char* text );
# 1800 "./extra/tinyxml2/./tinyxml2.h"
    XMLDeclaration* NewDeclaration( const char* text=0 );





    XMLUnknown* NewUnknown( const char* text );





    void DeleteNode( XMLNode* node );

    void ClearError() {
        SetError(XML_SUCCESS, 0, 0);
    }


    bool Error() const {
        return _errorID != XML_SUCCESS;
    }

    XMLError ErrorID() const {
        return _errorID;
    }
 const char* ErrorName() const;
    static const char* ErrorIDToName(XMLError errorID);




 const char* ErrorStr() const;


    void PrintError() const;


    int ErrorLineNum() const
    {
        return _errorLineNum;
    }


    void Clear();
# 1853 "./extra/tinyxml2/./tinyxml2.h"
 void DeepCopy(XMLDocument* target) const;


    char* Identify( char* p, XMLNode** node );


 void MarkInUse(XMLNode*);

    virtual XMLNode* ShallowClone( XMLDocument* ) const {
        return 0;
    }
    virtual bool ShallowEqual( const XMLNode* ) const {
        return false;
    }

private:
    XMLDocument( const XMLDocument& );
    void operator=( const XMLDocument& );

    bool _writeBOM;
    bool _processEntities;
    XMLError _errorID;
    Whitespace _whitespaceMode;
    mutable StrPair _errorStr;
    int _errorLineNum;
    char* _charBuffer;
    int _parseCurLineNum;
 int _parsingDepth;






 DynArray<XMLNode*, 10> _unlinked;

    MemPoolT< sizeof(XMLElement) > _elementPool;
    MemPoolT< sizeof(XMLAttribute) > _attributePool;
    MemPoolT< sizeof(XMLText) > _textPool;
    MemPoolT< sizeof(XMLComment) > _commentPool;

 static const char* _errorNames[XML_ERROR_COUNT];

    void Parse();

    void SetError( XMLError error, int lineNum, const char* format, ... );




 class DepthTracker {
 public:
  explicit DepthTracker(XMLDocument * document) {
   this->_document = document;
   document->PushDepth();
  }
  ~DepthTracker() {
   _document->PopDepth();
  }
 private:
  XMLDocument * _document;
 };
 void PushDepth();
 void PopDepth();

    template<class NodeType, int PoolElementSize>
    NodeType* CreateUnlinkedNode( MemPoolT<PoolElementSize>& pool );
};

template<class NodeType, int PoolElementSize>
inline NodeType* XMLDocument::CreateUnlinkedNode( MemPoolT<PoolElementSize>& pool )
{
    {};
    {};
    NodeType* returnNode = new (pool.Alloc()) NodeType( this );
    {};
    returnNode->_memPool = &pool;

 _unlinked.Push(returnNode);
    return returnNode;
}
# 1990 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLHandle
{
public:

    explicit XMLHandle( XMLNode* node ) : _node( node ) {
    }

    explicit XMLHandle( XMLNode& node ) : _node( &node ) {
    }

    XMLHandle( const XMLHandle& ref ) : _node( ref._node ) {
    }

    XMLHandle& operator=( const XMLHandle& ref ) {
        _node = ref._node;
        return *this;
    }


    XMLHandle FirstChild() {
        return XMLHandle( _node ? _node->FirstChild() : 0 );
    }

    XMLHandle FirstChildElement( const char* name = 0 ) {
        return XMLHandle( _node ? _node->FirstChildElement( name ) : 0 );
    }

    XMLHandle LastChild() {
        return XMLHandle( _node ? _node->LastChild() : 0 );
    }

    XMLHandle LastChildElement( const char* name = 0 ) {
        return XMLHandle( _node ? _node->LastChildElement( name ) : 0 );
    }

    XMLHandle PreviousSibling() {
        return XMLHandle( _node ? _node->PreviousSibling() : 0 );
    }

    XMLHandle PreviousSiblingElement( const char* name = 0 ) {
        return XMLHandle( _node ? _node->PreviousSiblingElement( name ) : 0 );
    }

    XMLHandle NextSibling() {
        return XMLHandle( _node ? _node->NextSibling() : 0 );
    }

    XMLHandle NextSiblingElement( const char* name = 0 ) {
        return XMLHandle( _node ? _node->NextSiblingElement( name ) : 0 );
    }


    XMLNode* ToNode() {
        return _node;
    }

    XMLElement* ToElement() {
        return ( _node ? _node->ToElement() : 0 );
    }

    XMLText* ToText() {
        return ( _node ? _node->ToText() : 0 );
    }

    XMLUnknown* ToUnknown() {
        return ( _node ? _node->ToUnknown() : 0 );
    }

    XMLDeclaration* ToDeclaration() {
        return ( _node ? _node->ToDeclaration() : 0 );
    }

private:
    XMLNode* _node;
};






class __attribute__((visibility("default"))) XMLConstHandle
{
public:
    explicit XMLConstHandle( const XMLNode* node ) : _node( node ) {
    }
    explicit XMLConstHandle( const XMLNode& node ) : _node( &node ) {
    }
    XMLConstHandle( const XMLConstHandle& ref ) : _node( ref._node ) {
    }

    XMLConstHandle& operator=( const XMLConstHandle& ref ) {
        _node = ref._node;
        return *this;
    }

    const XMLConstHandle FirstChild() const {
        return XMLConstHandle( _node ? _node->FirstChild() : 0 );
    }
    const XMLConstHandle FirstChildElement( const char* name = 0 ) const {
        return XMLConstHandle( _node ? _node->FirstChildElement( name ) : 0 );
    }
    const XMLConstHandle LastChild() const {
        return XMLConstHandle( _node ? _node->LastChild() : 0 );
    }
    const XMLConstHandle LastChildElement( const char* name = 0 ) const {
        return XMLConstHandle( _node ? _node->LastChildElement( name ) : 0 );
    }
    const XMLConstHandle PreviousSibling() const {
        return XMLConstHandle( _node ? _node->PreviousSibling() : 0 );
    }
    const XMLConstHandle PreviousSiblingElement( const char* name = 0 ) const {
        return XMLConstHandle( _node ? _node->PreviousSiblingElement( name ) : 0 );
    }
    const XMLConstHandle NextSibling() const {
        return XMLConstHandle( _node ? _node->NextSibling() : 0 );
    }
    const XMLConstHandle NextSiblingElement( const char* name = 0 ) const {
        return XMLConstHandle( _node ? _node->NextSiblingElement( name ) : 0 );
    }


    const XMLNode* ToNode() const {
        return _node;
    }
    const XMLElement* ToElement() const {
        return ( _node ? _node->ToElement() : 0 );
    }
    const XMLText* ToText() const {
        return ( _node ? _node->ToText() : 0 );
    }
    const XMLUnknown* ToUnknown() const {
        return ( _node ? _node->ToUnknown() : 0 );
    }
    const XMLDeclaration* ToDeclaration() const {
        return ( _node ? _node->ToDeclaration() : 0 );
    }

private:
    const XMLNode* _node;
};
# 2175 "./extra/tinyxml2/./tinyxml2.h"
class __attribute__((visibility("default"))) XMLPrinter : public XMLVisitor
{
public:






    XMLPrinter( FILE* file=0, bool compact = false, int depth = 0 );
    virtual ~XMLPrinter() {}


    void PushHeader( bool writeBOM, bool writeDeclaration );



    void OpenElement( const char* name, bool compactMode=false );

    void PushAttribute( const char* name, const char* value );
    void PushAttribute( const char* name, int value );
    void PushAttribute( const char* name, unsigned value );
 void PushAttribute(const char* name, int64_t value);
 void PushAttribute( const char* name, bool value );
    void PushAttribute( const char* name, double value );

    virtual void CloseElement( bool compactMode=false );


    void PushText( const char* text, bool cdata=false );

    void PushText( int value );

    void PushText( unsigned value );

 void PushText(int64_t value);

    void PushText( bool value );

    void PushText( float value );

    void PushText( double value );


    void PushComment( const char* comment );

    void PushDeclaration( const char* value );
    void PushUnknown( const char* value );

    virtual bool VisitEnter( const XMLDocument& );
    virtual bool VisitExit( const XMLDocument& ) {
        return true;
    }

    virtual bool VisitEnter( const XMLElement& element, const XMLAttribute* attribute );
    virtual bool VisitExit( const XMLElement& element );

    virtual bool Visit( const XMLText& text );
    virtual bool Visit( const XMLComment& comment );
    virtual bool Visit( const XMLDeclaration& declaration );
    virtual bool Visit( const XMLUnknown& unknown );





    const char* CStr() const {
        return _buffer.Mem();
    }





    int CStrSize() const {
        return _buffer.Size();
    }




    void ClearBuffer() {
        _buffer.Clear();
        _buffer.Push(0);
  _firstElement = true;
    }

protected:
 virtual bool CompactMode( const XMLElement& ) { return _compactMode; }




    virtual void PrintSpace( int depth );
    void Print( const char* format, ... );
    void Write( const char* data, size_t size );
    inline void Write( const char* data ) { Write( data, strlen( data ) ); }
    void Putc( char ch );

    void SealElementIfJustOpened();
    bool _elementJustOpened;
    DynArray< const char*, 10 > _stack;

private:
    void PrintString( const char*, bool restrictedEntitySet );

    bool _firstElement;
    FILE* _fp;
    int _depth;
    int _textDepth;
    bool _processEntities;
 bool _compactMode;

    enum {
        ENTITY_RANGE = 64,
        BUF_SIZE = 200
    };
    bool _entityFlag[ENTITY_RANGE];
    bool _restrictedEntityFlag[ENTITY_RANGE];

    DynArray< char, 20 > _buffer;


    XMLPrinter( const XMLPrinter& );
    XMLPrinter& operator=( const XMLPrinter& );
};


}
# 4 "ParseConfigData.h" 2



# 1 "./inc/oem.h" 1
# 8 "ParseConfigData.h" 2
# 1 "/usr/include/fcntl.h" 1 3 4
# 28 "/usr/include/fcntl.h" 3 4
extern "C" {






# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 3 4
struct flock
  {
    short int l_type;
    short int l_whence;

    __off_t l_start;
    __off_t l_len;




    __pid_t l_pid;
  };


struct flock64
  {
    short int l_type;
    short int l_whence;
    __off64_t l_start;
    __off64_t l_len;
    __pid_t l_pid;
  };



# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uio.h" 1 3 4
# 43 "/usr/include/x86_64-linux-gnu/bits/uio.h" 3 4
struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 39 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 2 3 4
# 241 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
enum __pid_type
  {
    F_OWNER_TID = 0,
    F_OWNER_PID,
    F_OWNER_PGRP,
    F_OWNER_GID = F_OWNER_PGRP
  };


struct f_owner_ex
  {
    enum __pid_type type;
    __pid_t pid;
  };
# 311 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
struct file_handle
{
  unsigned int handle_bytes;
  int handle_type;

  unsigned char f_handle[0];
};
# 341 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
extern "C" {




extern ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
    throw ();






extern int sync_file_range (int __fd, __off64_t __offset, __off64_t __count,
       unsigned int __flags);






extern ssize_t vmsplice (int __fdout, const struct iovec *__iov,
    size_t __count, unsigned int __flags);





extern ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
         __off64_t *__offout, size_t __len,
         unsigned int __flags);





extern ssize_t tee (int __fdin, int __fdout, size_t __len,
      unsigned int __flags);






extern int fallocate (int __fd, int __mode, __off_t __offset, __off_t __len);
# 396 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
   __off64_t __len);




extern int name_to_handle_at (int __dfd, const char *__name,
         struct file_handle *__handle, int *__mnt_id,
         int __flags) throw ();





extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
         int __flags);



}
# 61 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 2 3 4
# 36 "/usr/include/fcntl.h" 2 3 4
# 67 "/usr/include/fcntl.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 68 "/usr/include/fcntl.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 91 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 106 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];
# 115 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
  };



struct stat64
  {
    __dev_t st_dev;

    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;






    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;





    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 164 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];



  };
# 69 "/usr/include/fcntl.h" 2 3 4
# 137 "/usr/include/fcntl.h" 3 4
extern int fcntl (int __fd, int __cmd, ...);
# 146 "/usr/include/fcntl.h" 3 4
extern int open (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 156 "/usr/include/fcntl.h" 3 4
extern int open64 (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 170 "/usr/include/fcntl.h" 3 4
extern int openat (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 181 "/usr/include/fcntl.h" 3 4
extern int openat64 (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 192 "/usr/include/fcntl.h" 3 4
extern int creat (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 202 "/usr/include/fcntl.h" 3 4
extern int creat64 (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 221 "/usr/include/fcntl.h" 3 4
extern int lockf (int __fd, int __cmd, off_t __len);
# 230 "/usr/include/fcntl.h" 3 4
extern int lockf64 (int __fd, int __cmd, off64_t __len);







extern int posix_fadvise (int __fd, off_t __offset, off_t __len,
     int __advise) throw ();
# 250 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise64 (int __fd, off64_t __offset, off64_t __len,
       int __advise) throw ();
# 260 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate (int __fd, off_t __offset, off_t __len);
# 271 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);
# 282 "/usr/include/fcntl.h" 3 4
}
# 9 "ParseConfigData.h" 2
# 1 "/usr/include/unistd.h" 1 3 4
# 27 "/usr/include/unistd.h" 3 4
extern "C" {
# 202 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h" 1 3 4
# 203 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/environments.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h" 2 3 4
# 207 "/usr/include/unistd.h" 2 3 4
# 226 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 227 "/usr/include/unistd.h" 2 3 4
# 274 "/usr/include/unistd.h" 3 4
typedef __socklen_t socklen_t;
# 287 "/usr/include/unistd.h" 3 4
extern int access (const char *__name, int __type) throw () __attribute__ ((__nonnull__ (1)));




extern int euidaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));


extern int eaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));






extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;
# 334 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) throw ();
# 345 "/usr/include/unistd.h" 3 4
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     throw ();






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 376 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset) ;
# 404 "/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) throw () ;




extern int pipe2 (int __pipedes[2], int __flags) throw () ;
# 432 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) throw ();
# 444 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     throw ();






extern int usleep (__useconds_t __useconds);
# 469 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) throw () ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int chdir (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) throw () ;
# 511 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) throw () ;





extern char *get_current_dir_name (void) throw ();







extern char *getwd (char *__buf)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) throw () ;


extern int dup2 (int __fd, int __fd2) throw ();




extern int dup3 (int __fd, int __fd2, int __flags) throw ();



extern char **__environ;

extern char **environ;





extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) throw () __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     throw () __attribute__ ((__nonnull__ (2)));




extern int execv (const char *__path, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern int nice (int __inc) throw () ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 610 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     throw () __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) throw ();


extern long int sysconf (int __name) throw ();



extern size_t confstr (int __name, char *__buf, size_t __len) throw ();




extern __pid_t getpid (void) throw ();


extern __pid_t getppid (void) throw ();


extern __pid_t getpgrp (void) throw ();


extern __pid_t __getpgid (__pid_t __pid) throw ();

extern __pid_t getpgid (__pid_t __pid) throw ();






extern int setpgid (__pid_t __pid, __pid_t __pgid) throw ();
# 660 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) throw ();






extern __pid_t setsid (void) throw ();



extern __pid_t getsid (__pid_t __pid) throw ();



extern __uid_t getuid (void) throw ();


extern __uid_t geteuid (void) throw ();


extern __gid_t getgid (void) throw ();


extern __gid_t getegid (void) throw ();




extern int getgroups (int __size, __gid_t __list[]) throw () ;



extern int group_member (__gid_t __gid) throw ();






extern int setuid (__uid_t __uid) throw () ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) throw () ;




extern int seteuid (__uid_t __uid) throw () ;






extern int setgid (__gid_t __gid) throw () ;




extern int setregid (__gid_t __rgid, __gid_t __egid) throw () ;




extern int setegid (__gid_t __gid) throw () ;





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     throw ();



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     throw ();



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     throw () ;



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     throw () ;






extern __pid_t fork (void) throw ();







extern __pid_t vfork (void) throw ();





extern char *ttyname (int __fd) throw ();



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) throw ();





extern int ttyslot (void) throw ();




extern int link (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     throw () __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) throw () __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (const char *__name) throw () __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     throw () __attribute__ ((__nonnull__ (2)));



extern int rmdir (const char *__path) throw () __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) throw ();


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) throw ();






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (const char *__name) throw () __attribute__ ((__nonnull__ (1)));
# 871 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 48 "/usr/include/getopt.h" 3 4
extern "C" {
# 57 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 71 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 150 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       throw ();
# 185 "/usr/include/getopt.h" 3 4
}
# 872 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) throw () __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) throw () ;





extern int getdomainname (char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) throw ();


extern int revoke (const char *__file) throw () __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     throw () __attribute__ ((__nonnull__ (1)));





extern int acct (const char *__name) throw ();



extern char *getusershell (void) throw ();
extern void endusershell (void) throw ();
extern void setusershell (void) throw ();





extern int daemon (int __nochdir, int __noclose) throw () ;






extern int chroot (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));







extern int fsync (int __fd);





extern int syncfs (int __fd) throw ();






extern long int gethostid (void);


extern void sync (void) throw ();





extern int getpagesize (void) throw () __attribute__ ((__const__));




extern int getdtablesize (void) throw ();
# 993 "/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1005 "/usr/include/unistd.h" 3 4
extern int truncate64 (const char *__file, __off64_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1016 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) throw () ;
# 1026 "/usr/include/unistd.h" 3 4
extern int ftruncate64 (int __fd, __off64_t __length) throw () ;
# 1037 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) throw () ;





extern void *sbrk (intptr_t __delta) throw ();
# 1058 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) throw ();
# 1112 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);







extern char *crypt (const char *__key, const char *__salt)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern void encrypt (char *__glibc_block, int __edflag)
     throw () __attribute__ ((__nonnull__ (1)));






extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));
# 1151 "/usr/include/unistd.h" 3 4
}
# 10 "ParseConfigData.h" 2

# 1 "StoreConfigData.h" 1
# 11 "StoreConfigData.h"
# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4
extern "C" {


extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     throw () __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     throw () __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     throw () __attribute__ ((__noreturn__));


}
# 12 "StoreConfigData.h" 2

using namespace std;
using namespace tinyxml2;



class StoreConfigData
{
private:
 int fd;

 uint8 sectorBuffer[512];
 uint8 *sectorPtr;
 int sBufferLeft;

 uint8 readSectorBuffer[512];
 uint8 *readSectorPtr;
 int readBufferLeft;


public:
 StoreConfigData(int fd);
 ~StoreConfigData();

 void reset();
 int store(uint8* data, uint32 length);
 int push();

 uint32 get(uint8* data, uint32 length);

 void runTestSuit();
};
# 12 "ParseConfigData.h" 2
# 1 "/usr/include/assert.h" 1 3 4
# 13 "ParseConfigData.h" 2

using namespace std;
using namespace tinyxml2;
# 197 "ParseConfigData.h"
class ParseConfigData
{
private:
 StoreConfigData *configStore;
 XMLElement *xmlRoot;
 uint8 y;

 int parseSlotData(XMLElement *xmlRoot);
 int parseCategoryData(XMLElement *xmlRoot);
 int parseCodeData(XMLElement *xmlRoot);

 int parse_3gpp_Network_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_Network_Subset_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_Service_Provider_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_Corporate_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_SPN_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_SP_EHPLMN_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_ICCID_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_IMPI_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_NS_SP_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp_SIM_Category_Data(XMLElement *xmlRoot);

 int parse_3gpp2_Network1_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp2_Network2_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp2_HRPD_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp2_Service_Provider_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp2_Corporate_Category_Data(XMLElement *xmlRoot);
 int parse_3gpp2_RUIM_Category_Data(XMLElement *xmlRoot);

 void genTestXml();

 uint8 parseHex(char high, char low);

public:
 ParseConfigData(XMLElement *xmlRoot, StoreConfigData *configStore);
 ParseConfigData(const char* configXml, const char* configData);
 ~ParseConfigData();

 int parseConfigData(XMLElement *xmlOtherRoot = __null);

 int parseRawData(int fd = -1);

 void runTestSuit();
};
# 2 "ParseConfigData.cpp" 2

using namespace std;
using namespace tinyxml2;


ParseConfigData::ParseConfigData(XMLElement *xmlRoot, StoreConfigData *configStore)
{
 ((configStore) ? static_cast<void> (0) : __assert_fail ("configStore", "ParseConfigData.cpp", 9, __PRETTY_FUNCTION__));
 this->configStore = configStore;

 this->xmlRoot = xmlRoot;
}


ParseConfigData::ParseConfigData(const char* configXml, const char* configData)
{
 ((configData) ? static_cast<void> (0) : __assert_fail ("configData", "ParseConfigData.cpp", 18, __PRETTY_FUNCTION__));

 int configDataFd = open(configData, 02|0100|01000, 0666);
 this->configStore = new StoreConfigData(configDataFd);

 if (configXml) {
  XMLDocument doc;
  XMLError xmlRet = doc.LoadFile(configXml);
  ((XML_SUCCESS == xmlRet) ? static_cast<void> (0) : __assert_fail ("XML_SUCCESS == xmlRet", "ParseConfigData.cpp", 26, __PRETTY_FUNCTION__));
  this->xmlRoot = doc.FirstChildElement("config");
 }
}


ParseConfigData::~ParseConfigData()
{
 configStore->push();
}


int ParseConfigData::parse_3gpp_Network_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_NW;

 simlock_nw_code_list_type *nw_list_ptr = &(categoryData.code_data.nw_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mcc, child->GetText(), mcc_len); }; memset(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mnc.mnc_data, mnc, nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes].mnc.mnc_len); };;

  nw_list_ptr->num_nw_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_Network_Subset_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_NS;

 simlock_ns_code_list_type *ns_list_ptr = &(categoryData.code_data.ns_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mnc.mnc_data, mnc, ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("imsi_digit""6"); if (!child) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit6 = 0xFF; } else { const char *digit = child->GetText(); if (strlen(digit) < 1) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit6 = 0xFF; } else if (strlen(digit)) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit6 = parseHex('0', digit[0]); } else { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit6 = parseHex(digit[0], digit[1]); } };

  child = parent->FirstChildElement("imsi_digit""7"); if (!child) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit7 = 0xFF; } else { const char *digit = child->GetText(); if (strlen(digit) < 1) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit7 = 0xFF; } else if (strlen(digit)) { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit7 = parseHex('0', digit[0]); } else { ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].imsi_digit7 = parseHex(digit[0], digit[1]); } };

  ns_list_ptr->num_ns_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_Service_Provider_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_SP;

 simlock_sp_code_list_type *sp_list_ptr = &(categoryData.code_data.sp_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mnc.mnc_data, mnc, sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("gid""1"); memset(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].gid1.gid_data, 0xFF, 8); if (!child) { sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].gid1.gid_len = 0; } else { const char *gid = child->GetText(); int gid_len = strlen(gid)/2; sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].gid1.gid_len = gid_len > 8? 8: gid_len; for (int i = 0; i < sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].gid1.gid_len; i++) { sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].gid1.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); } };

  sp_list_ptr->num_sp_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_Corporate_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_CP;

 simlock_cp_code_list_type *cp_list_ptr = &(categoryData.code_data.cp_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mnc.mnc_data, mnc, cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("gid""1"); memset(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid1.gid_data, 0xFF, 8); if (!child) { cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid1.gid_len = 0; } else { const char *gid = child->GetText(); int gid_len = strlen(gid)/2; cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid1.gid_len = gid_len > 8? 8: gid_len; for (int i = 0; i < cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid1.gid_len; i++) { cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid1.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); } };

  child = parent->FirstChildElement("gid""2"); memset(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid2.gid_data, 0xFF, 8); if (!child) { cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid2.gid_len = 0; } else { const char *gid = child->GetText(); int gid_len = strlen(gid)/2; cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid2.gid_len = gid_len > 8? 8: gid_len; for (int i = 0; i < cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid2.gid_len; i++) { cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].gid2.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); } };

  cp_list_ptr->num_cp_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_SPN_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_SPN;

 simlock_spn_code_list_type *spn_list_ptr = &(categoryData.code_data.spn_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mnc.mnc_data, mnc, spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("spn_valid"); if (!child) { spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].spn.spn_valid = 0; } else { spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].spn.spn_valid = !!child->IntText(); } memset(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].spn.spn_data, 0xFF, 16); child = parent->FirstChildElement("spn_data"); if (child) { const char *spn = child->GetText(); int spn_len = strlen(spn)/2; for (int i = 0; i < spn_len && i < 16 ; i++) { spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].spn.spn_data[i] = parseHex(spn[2*i], spn[2*i+1]); } };

  spn_list_ptr->num_spn_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_SP_EHPLMN_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_SP_EHPLMN;

 simlock_sp_ehplmn_code_list_type *sp_ehplmn_list_ptr = &(categoryData.code_data.sp_ehplmn_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mnc.mnc_data, mnc, sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("gid""1"); memset(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].gid1.gid_data, 0xFF, 8); if (!child) { sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].gid1.gid_len = 0; } else { const char *gid = child->GetText(); int gid_len = strlen(gid)/2; sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].gid1.gid_len = gid_len > 8? 8: gid_len; for (int i = 0; i < sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].gid1.gid_len; i++) { sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].gid1.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); } };

  memset(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mcc, '*', 3); child = parent->FirstChildElement("ehplmnmcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mcc, child->GetText(), mcc_len); }; memset(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("ehplmnmnc"); if (!child) { sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mnc.mnc_data, mnc, sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code.mnc.mnc_len); };;

  sp_ehplmn_list_ptr->num_sp_ehplmn_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_ICCID_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_ICCID;

 simlock_iccid_code_list_type *iccid_list_ptr = &(categoryData.code_data.iccid_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mnc.mnc_data, mnc, iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code.mnc.mnc_len); };;

  memset(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].iccid.iccid_data, '*', 20); child = parent->FirstChildElement("iccid"); if (child) { const char * iccid = child->GetText(); int iccid_len = strlen(iccid); iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].iccid.iccid_len = iccid_len > 20? 20: iccid_len; for (int i = 0; i < iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].iccid.iccid_len; i++) { if (iccid[i] >= '0' && iccid[i] <= '9') { iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].iccid.iccid_data[i] = iccid[i]; } } };

  iccid_list_ptr->num_iccid_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_IMPI_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_IMPI;

 simlock_impi_code_list_type *impi_list_ptr = &(categoryData.code_data.impi_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi.impi_data, 0x0, 64); child = parent->FirstChildElement("impi"); if (!child) { impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi.impi_len = 0; } else { const char *data = child->GetText(); int data_len = strlen(data); impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi.impi_len = data_len > 64? 64: data_len; memcpy(impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi.impi_data, data, impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi.impi_len); };;

  impi_list_ptr->num_impi_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_NS_SP_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_NS_SP;

 simlock_ns_sp_code_list_type *ns_sp_list_ptr = &(categoryData.code_data.ns_sp_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mcc, child->GetText(), mcc_len); }; memset(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mnc.mnc_data, mnc, ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code.mnc.mnc_len); };;

  child = parent->FirstChildElement("imsi_digit""6"); if (!child) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit6 = 0xFF; } else { const char *digit = child->GetText(); if (strlen(digit) < 1) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit6 = 0xFF; } else if (strlen(digit)) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit6 = parseHex('0', digit[0]); } else { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit6 = parseHex(digit[0], digit[1]); } };

  child = parent->FirstChildElement("imsi_digit""7"); if (!child) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit7 = 0xFF; } else { const char *digit = child->GetText(); if (strlen(digit) < 1) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit7 = 0xFF; } else if (strlen(digit)) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit7 = parseHex('0', digit[0]); } else { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.imsi_digit7 = parseHex(digit[0], digit[1]); } };

  child = parent->FirstChildElement("gid""1"); memset(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].gid1.gid_data, 0xFF, 8); if (!child) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].gid1.gid_len = 0; } else { const char *gid = child->GetText(); int gid_len = strlen(gid)/2; ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].gid1.gid_len = gid_len > 8? 8: gid_len; for (int i = 0; i < ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].gid1.gid_len; i++) { ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].gid1.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); } };

  ns_sp_list_ptr->num_ns_sp_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parse_3gpp_SIM_Category_Data(XMLElement *xmlRoot)
{

 XMLElement *codeElement, *parent, *child;

 simlock_category_data_type categoryData;

 memset(&categoryData, 0x0, sizeof(categoryData));

 categoryData.category_type = SIMLOCK_CATEGORY_3GPP_SIM;

 simlock_sim_code_list_type *sim_list_ptr = &(categoryData.code_data.sim_3gpp_code_list);

 codeElement = xmlRoot->FirstChildElement("code");


 while(codeElement)
 {

  parent = codeElement;

  memset(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mcc, '*', 3); child = parent->FirstChildElement("mcc"); if (child) { const char* mcc = child->GetText(); int mcc_len = strlen(mcc); mcc_len > 3? 3: mcc_len; memcpy(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mcc, child->GetText(), mcc_len); }; memset(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mnc.mnc_data, '*', 3); child = parent->FirstChildElement("mnc"); if (!child) { sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mnc.mnc_len = 0; } else { const char *mnc = child->GetText(); int mnc_len = strlen(mnc); sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mnc.mnc_len = mnc_len > 3? 3: mnc_len; memcpy(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mnc.mnc_data, mnc, sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code.mnc.mnc_len); };;

  memset(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin.msin_data, 0x0, 10); child = parent->FirstChildElement("msin"); if (!child) { sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin.msin_len = 0; } else { const char *data = child->GetText(); int data_len = strlen(data); sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin.msin_len = data_len > 10? 10: data_len; memcpy(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin.msin_data, data, sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin.msin_len); };;

  sim_list_ptr->num_sim_codes++;

  codeElement = codeElement->NextSiblingElement("code");
 }


 this->configStore->store((uint8*) &categoryData, sizeof(categoryData));;

 return 0;
}


int ParseConfigData::parseCategoryData(XMLElement *xmlRoot)
{

 XMLElement *categoryElement, *parent, *child;
 categoryElement = xmlRoot->FirstChildElement("category");


 if (!categoryElement)
 {
  fprintf(stdout, "No category tag, only set categoryCount 0!\n");
  { y = (uint8)(0); this->configStore->store(&y, 1); };
  return 0;
 }


 uint8 categoryCount = 0;
 while (categoryElement)
 {
  categoryCount++;
  categoryElement = categoryElement->NextSiblingElement("category");
 }
 { y = (uint8)(categoryCount); this->configStore->store(&y, 1); };


 categoryElement = xmlRoot->FirstChildElement("category");


 while(categoryElement)
 {

  XMLElement *categoryEnum = categoryElement->FirstChildElement("simlock_category_enum_type");

  int type = categoryEnum? categoryEnum->IntText(): 0;

  if (SIMLOCK_CATEGORY_3GPP_NW > type || SIMLOCK_CATEGORY_3GPP2_RUIM < type)
  {
   fprintf(stderr, "Invalid simlock_category_enum_type: %d, reset simlock_category_enum_type = 0!\n", type);
   type = 0;
  }

  parent = categoryElement;

  { y = (uint8)(0xAA); this->configStore->store(&y, 1); };




  { child = parent->FirstChildElement("simlock_status_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

  { child = parent->FirstChildElement("simlock_sfs_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

  { child = parent->FirstChildElement("auto_lock"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(!!child->IntText()); this->configStore->store(&y, 1); }; }; };

  { child = parent->FirstChildElement("is_blacklist"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(!!child->IntText()); this->configStore->store(&y, 1); }; }; };

  { child = parent->FirstChildElement("retry_times"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };





  switch(type)
  {
   case SIMLOCK_CATEGORY_3GPP_NW:
    parse_3gpp_Network_Category_Data(categoryElement);
    break;
   default:
    break;
  }

  categoryElement = categoryElement->NextSiblingElement("category");
 }
}


int ParseConfigData::parseSlotData(XMLElement *xmlRoot)
{

 XMLElement *slotElement, *parent, *child;
 slotElement = xmlRoot->FirstChildElement("slot");


 if (!slotElement)
 {
  fprintf(stdout, "No slot tag, only set slotCount 0!\n");
  { y = (uint8)(0); this->configStore->store(&y, 1); };
  return 0;
 }


 uint8 slotCount = 0;
 while (slotElement)
 {
  slotCount++;
  slotElement = slotElement->NextSiblingElement("slot");
 }
 { y = (uint8)(slotCount); this->configStore->store(&y, 1); };


 slotElement = xmlRoot->FirstChildElement("slot");


 while (slotElement)
 {

  parent = slotElement;

  { y = (uint8)(0x5A); this->configStore->store(&y, 1); };

  { child = parent->FirstChildElement("simlock_slot_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

  { child = parent->FirstChildElement("simlock_disabled_slot_data_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(!!child->IntText()); this->configStore->store(&y, 1); }; }; };

  parseCategoryData(slotElement);

  slotElement = slotElement->NextSiblingElement("slot");
 }

 return 0;
}


int ParseConfigData::parseConfigData(XMLElement *xmlOtherRoot)
{

 if (!configStore)
 {
  fprintf(stderr, "%s: illegal configStore!\n", __FUNCTION__);
  return -1;
 }

 if (xmlOtherRoot)
 {
  this->xmlRoot = xmlOtherRoot;
 }

 if (!this->xmlRoot)
 {
  fprintf(stderr, "%s: illegal xmlRoot!\n", __FUNCTION__);
  return -1;
 }


 this->configStore->reset();;


 XMLElement *parent, *child;

 parent = xmlRoot->FirstChildElement("config");


 { y = (uint8)(0xA5); this->configStore->store(&y, 1); };

 { y = (uint8)(1); this->configStore->store(&y, 1); };

 { y = (uint8)(0); this->configStore->store(&y, 1); };

 { child = parent->FirstChildElement("config_simlock_sfs_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

 { child = parent->FirstChildElement("simlock_device_mode_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

 { child = parent->FirstChildElement("simlock_slot_policy_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

 { child = parent->FirstChildElement("simlock_subscription_policy_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };

 { child = parent->FirstChildElement("simlock_rsu_mode_enum_type"); if (!child) { { y = (uint8)(0); this->configStore->store(&y, 1); }; } else { { y = (uint8)(child->IntText()); this->configStore->store(&y, 1); }; }; };


 parseSlotData(xmlRoot);


 this->configStore->push();;

 return 0;
}


int ParseConfigData::parseRawData(int fd)
{

 return 0;
}


uint8 ParseConfigData::parseHex(char high, char low)
{
 uint8 value = 0xFF;

 if (high >= '0' && high <= '9')
 {
  value |= (((high - '0') << 4) & 0xF0);
 }
 else if (high >= 'a' && high <= 'f')
 {
  value |= (((high - 'a' + 10) << 4) & 0xF0);
 }
 else if (high >= 'A' && high <= 'F')
 {
  value |= (((high - 'A' + 10) << 4) & 0xF0);
 }

 if (low >= '0' && low <= '9')
 {
  value |= ((low - '0') & 0x0F);
 }
 else if (low >= 'a' && low <= 'f')
 {
  value |= ((low - 'a' + 10) & 0x0F);
 }
 else if (low >= 'A' && low <= 'F')
 {
  value |= ((low - 'A' + 10) & 0x0F);
 }

 return value;
}



void ParseConfigData::genTestXml()
{
 int fd = open("test.xml", 02|0100|01000, 0666);
 char *str;
 str = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n";
 write(fd, str, strlen(str));
 str = "<config>\n";
 write(fd, str, strlen(str));
 str = "\t<slot></slot>\n";
 write(fd, str, strlen(str));
 str = "\t<slot><simlock_slot_enum_type>123</simlock_slot_enum_type></slot>\n";
 write(fd, str, strlen(str));
 str = "</config>\n";
 write(fd, str, strlen(str));
 close(fd);
}


void ParseConfigData::runTestSuit()
{
 genTestXml();
 XMLDocument doc;
 XMLError xmlRet = doc.LoadFile("test.xml");
 ((XML_SUCCESS == xmlRet) ? static_cast<void> (0) : __assert_fail ("XML_SUCCESS == xmlRet", "ParseConfigData.cpp", 656, __PRETTY_FUNCTION__));
 ((configStore) ? static_cast<void> (0) : __assert_fail ("configStore", "ParseConfigData.cpp", 657, __PRETTY_FUNCTION__));
 xmlRoot = doc.FirstChildElement("config");
 ((xmlRoot) ? static_cast<void> (0) : __assert_fail ("xmlRoot", "ParseConfigData.cpp", 659, __PRETTY_FUNCTION__));

 fprintf(stdout, "BEGIN: check FIRST slot tag, expect NO simlock_slot_enum_type get!\n");
 XMLElement *slot = xmlRoot->FirstChildElement("slot");
 ((slot) ? static_cast<void> (0) : __assert_fail ("slot", "ParseConfigData.cpp", 663, __PRETTY_FUNCTION__));
 XMLElement *slot_enum = slot->FirstChildElement("simlock_slot_enum_type");
 ((!slot_enum) ? static_cast<void> (0) : __assert_fail ("!slot_enum", "ParseConfigData.cpp", 665, __PRETTY_FUNCTION__));
 fprintf(stdout, "SUCCESS END: check FIRST slot tag, expect NO simlock_slot_enum_type get !\n");

 fprintf(stdout, "BEGIN: check SECOND slot tag, expect ONE simlock_slot_enum_type get!\n");
 slot = slot->NextSiblingElement("slot");
 ((slot) ? static_cast<void> (0) : __assert_fail ("slot", "ParseConfigData.cpp", 670, __PRETTY_FUNCTION__));
 slot_enum = slot->FirstChildElement("simlock_slot_enum_type");
 ((slot_enum) ? static_cast<void> (0) : __assert_fail ("slot_enum", "ParseConfigData.cpp", 672, __PRETTY_FUNCTION__));
 ((123 == slot_enum->IntText()) ? static_cast<void> (0) : __assert_fail ("123 == slot_enum->IntText()", "ParseConfigData.cpp", 673, __PRETTY_FUNCTION__));
 fprintf(stdout, "SUCCESS END: check SECOND slot tag, expect ONE simlock_slot_enum_type get!\n");

 configStore->runTestSuit();
}
