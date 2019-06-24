#ifndef SIMLOCK_COMMON_H
#define SIMLOCK_COMMON_H
/*===========================================================================


            S I M L O C K   C O M M O N   D E F I N I T I O N S

                      A N D

                F U N C T I O N S


===========================================================================*/

/*===========================================================================
                        COPYRIGHT INFORMATION

Copyright (c) 2014 - 2018 QUALCOMM Technologies, Inc (QTI) and its licensors.
All Rights Reserved.  QUALCOMM Technologies Proprietary.
Export of this technology or software
is regulated by the U.S. Government. Diversion contrary to U.S. law prohibited.

                        EDIT HISTORY FOR MODULE

This section contains comments describing changes made to the module.
Notice that changes are listed in reverse chronological order.

$Header: //components/rel/uim.mpss/3.1.2.2/api/simlock_common.h#5 $$ $DateTime: 2018/11/20 22:33:39 $

when       who     what, where, why
--------   ---     ----------------------------------------------------------- 
11/20/18   vdc     Remote SIM Unlock support for simlock rsu mode E & F
09/19/18   sg      Remote SIM Unlock support for SIMLOCK_RSU_MODE_D
06/20/18   rps     Added support for Blob 5.0
02/14/18   nr      Remote SIM Unlock support to switch configuration
02/14/18   vdc     Added support for changing lock code configuration data
02/13/18   bcho    Make device dual SIM to single SIM via RSU BLOB
02/04/18   vdc     Added support for NS+SP category
12/05/17   nr      Added support for IMPI simlock
07/21/17   vdc     Added support for changing control key
07/13/17   nr      Remote SIM Unlock supported in common build 
07/13/17   av      Enhanced simlock RSU solution
04/16/17   bcho    Set perso status properly if sub is locked due to other app
04/11/17   bcho    Check slot and sub policy values before queuing the request
02/20/17   vdc     Added support to probe CK for correctness
01/26/17   bcho    Support for slot policy valid card must on all slots
01/05/17   vdc     Limit policy wait for full srv or imsi matched to 3GPP
12/20/16   vdc     Support for simlock policy wait for full srv or imsi matched
12/02/16   vdc     Added support to check RSA public key for remote lock
12/01/16   vdc     Extend blob to support lock/unlock with HCK
11/03/16   bcho    Added support for ICCID simlock
11/03/16   bcho    Support for multi-app policy in SimLock for OR condition
10/28/16   nr      Support remote and local configurations together
10/06/16   ar      Added support for SP + EHPLMN simlock
09/02/16   vdc     Extend full and expired service policies on any slot
08/18/16   ar      Add support for simlock storage and emergency only mode
08/03/16   vdc     Added support for SPN based SIMLOCK feature
02/19/16   vdc     Send control key presence in get config presence
12/17/15   av      Introduced client reg and pre_policy valid IMSI check APIs
09/28/15   vv      Support for reuse code data
08/19/15   vv      Added support to retrieve retry attempts left for locking
05/15/15   vv      Support for RSU set configuration in simlock
03/19/15   at      Introducing new relock feature in SIMLock
03/04/15   vv      Added support for new perso status
02/17/15   vv      Indicate the reason for invalid subscription
01/14/15   bcho    Remove SIMLOCK_MIN_GID_LEN
12/30/14   bcho    Support for more then 1 bytes of GID1/GID2
12/26/14   vv      Support for whitelist and blacklist codes in same category
09/29/14   vv      Added support for emergency only mode
09/17/14   tl      Add support for perso and deperso secure
08/29/14   vv      Added support for temporary unlock
08/27/14   tl      Introduce network related SIM Lock slot policies
08/25/14   tl      Introduce master slot 1 slot policy
06/04/14   vv      Remove FEATURE_SIMLOCK
04/15/14   vv      Added support for quad SIM
04/14/14   vv      Added support for identifying conflicting codes
03/26/14   tl      Secondary revisions
01/07/14   vv      Initial revision
===========================================================================*/


/* <EJECT> */
/*===========================================================================

                     INCLUDE FILES FOR MODULE

===========================================================================*/
//#include "comdef.h"

/*===========================================================================

                        DATA DECLARATIONS

===========================================================================*/
/* Codes related defines */
#define SIMLOCK_CK_MAX               16
#define SIMLOCK_MCC_LEN              3
#define SIMLOCK_MNC_MAX              3
#define SIMLOCK_MSIN_MAX             10
#define SIMLOCK_IRM_LEN              4
#define SIMLOCK_ICCID_DIGITS_MAX     20
#define SIMLOCK_IMPI_MAX             64
#define SIMLOCK_NUM_CODES_MAX        20

/* Hash related defines */
#define SIMLOCK_SALT_LEN             16
#define SIMLOCK_HCK_LEN              32
#define SIMLOCK_RSU_DEVICE_KEY_LEN   32

#define SIMLOCK_SUBS_COUNT_MAX       4
#define SIMLOCK_SLOT_COUNT_MAX       4
#define SIMLOCK_CATEGORY_COUNT_MAX   16

#define SIMLOCK_MIN_VALID_IMSI_LEN   3
#define SIMLOCK_MAX_VALID_IMSI_LEN   8
#define SIMLOCK_MAX_GID_LEN          8
#define SIMLOCK_SPN_LEN              16
#define SIMLOCK_EHPLMN_NUM_MAX       32
#define SIMLOCK_PLMN_ID_LEN          3
#define SIMLOCK_IMSI_FILE_LEN        10
#define SIMLOCK_AD_FILE_LEN          4
#define SIMLOCK_ICCID_LEN            10
#define SIMLOCK_PUBKEY_MODULUS_LEN   256
#define SIMLOCK_PUBKEY_EXPONENT_LEN  3

/*=============================================================================

                   ENUMERATED DATA DECLARATIONS

=============================================================================*/

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_RESULT_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the result of SIMLock request message
-------------------------------------------------------------------------------*/
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

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_MESSAGE_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the message types SIMLock supports
-------------------------------------------------------------------------------*/
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

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SET_OPERATION_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the set policy and/or slot configuration operation
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SET_POLICY_OPERATION,
  /* Set slot - subscription policy. */
  SIMLOCK_SET_POLICY_AND_SLOT_CONFIG_OPERATION,
  /* Set slot - subscription policy and slot configuration. */
  SIMLOCK_SET_SLOT_CONFIG_OPERATION
  /* Set slot configuration */
} simlock_set_operation_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SLOT_POLICY_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the supported lock policies for additional
     slots (e.g. slot-2, slot-3) with respect to the lock policy on slot-1
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SLOT_POLICY_SAME_ON_ALL_SLOTS,
  /* Additional slots have same SimLock configuration as slot 1 */
  SIMLOCK_SLOT_POLICY_UNIQUE_FOR_EACH_SLOT,
  /* Each slot as independent SimLock configuration (enabled categories, codes,
     control keys) */
  SIMLOCK_SLOT_POLICY_LOCK_ONLY_SLOT_1,
  /* SimLock configuration is valid only for slot 1, while all other slots are always
     unlocked, regardless of card present in slot 1 */
  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_SLOT_1,
  /* Additional slots are valid only if card on slot 1 is present and verified */
  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_ANY_SLOT,
  /* All slots are free and take the configuration of slot 1 as long as there is a
     valid card is present in any slot */
  SIMLOCK_SLOT_POLICY_MASTER_SLOT_1,
  /* Each additional slot is valid if a valid card is present in that slot or if a
     valid card is present in slot 1 */
  SIMLOCK_SLOT_POLICY_BLOCK_ALL_SLOTS_IF_SLOT_1_EXPIRED,
  /* All slots will remain free until network expires on slot 1.
     If network expires on slot 1, then all slots will be blocked */
  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_SLOT_1,
  /* All slots will remain blocked until full network service is
     acquired on slot 1 at which point all slots will be free. */
  SIMLOCK_SLOT_POLICY_BLOCK_ALL_SLOTS_IF_ALL_VALID_SLOTS_EXPIRED,
  /* All slots are free initially. If network expires on all valid slots which 
     satisfies all the enabled categories, then all invalid slots will be blocked */
  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_ANY_VALID_SLOT,
  /* All slots will remain blocked until full network service is
     acquired on any slot which satisfies all the enabled categories 
     at which point all slots will be free. */
  SIMLOCK_SLOT_POLICY_WAIT_FOR_FULL_SERVICE_ON_ANY_VALID_SLOT_OR_IMSI_MATCH,
  /* All slots will remain blocked until full network service is acquired 
     on any slot or matches the previous IMSI for 3GPP which had acquired full
     service in the past */
  SIMLOCK_SLOT_POLICY_VALID_CARD_MUST_ON_ALL_SLOTS,
  /* If at least one card is present and considered invalid, then all cards are
     marked as invalid */
  SIMLOCK_SLOT_POLICY_MAX
} simlock_slot_policy_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SUBSCRIPTION_POLICY_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the supported subscription policies
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SUBSCRIPTION_POLICY_INDEPENDENT,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_AND_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_VALID_3GPP_OR_3GPP2_REQUIRED,
  SIMLOCK_SUBSCRIPTION_POLICY_MAX
} simlock_subscription_policy_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_RSU_MODE_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the supported SimLock rsu mode configuration
-------------------------------------------------------------------------------*/
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

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SUBSCRIPTION_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the subscriptions
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SUBSCRIPTION_NONE,
  SIMLOCK_SUBSCRIPTION_3GPP,
  SIMLOCK_SUBSCRIPTION_3GPP2
} simlock_subscription_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_CATEGORY_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the SIMLock categories
-------------------------------------------------------------------------------*/
typedef enum : uint8 {
  SIMLOCK_CATEGORY_3GPP_NW,            /* Network Personalization Feature              */
  SIMLOCK_CATEGORY_3GPP_NS,            /* Network Subset Personalization Feature       */
  SIMLOCK_CATEGORY_3GPP_SP,            /* Service Provider Personalization Feature     */
  SIMLOCK_CATEGORY_3GPP_CP,            /* Corporate Personalization Feature            */
  SIMLOCK_CATEGORY_3GPP_SPN,           /* SPN Personalization Feature                  */
  SIMLOCK_CATEGORY_3GPP_SP_EHPLMN,     /* SP + EHPLMN Personalization feature          */
  SIMLOCK_CATEGORY_3GPP_ICCID,         /* ICCID Personalization feature                */
  SIMLOCK_CATEGORY_3GPP_IMPI,          /* IMPI Personalization feature                 */
  SIMLOCK_CATEGORY_3GPP_NS_SP,         /* NS + SP Personalization feature              */
  SIMLOCK_CATEGORY_3GPP_SIM,           /* SIM/USIM Personalization Feature             */

  SIMLOCK_CATEGORY_3GPP2_NW_TYPE1,     /* Network1 Personalization Feature             */
  SIMLOCK_CATEGORY_3GPP2_NW_TYPE2,     /* Network2 Personalization Feature             */
  SIMLOCK_CATEGORY_3GPP2_HRPD,         /* HRPD Personalization Feature                 */
  SIMLOCK_CATEGORY_3GPP2_SP,           /* Service Provider Personalization Feature     */
  SIMLOCK_CATEGORY_3GPP2_CP,           /* Corporate Personalization Feature            */
  SIMLOCK_CATEGORY_3GPP2_RUIM          /* RUIM Personalization Feature                 */
} simlock_category_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SLOT_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the card slots
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SLOT_1  = 0, /**< Directs the request to the
                            SIM/USIM/RUIM/CSIM inserted in Slot 1. */
  SIMLOCK_SLOT_2,      /**< Directs the request to the
                            SIM/USIM/RUIM/CSIM inserted in Slot 2. */
  SIMLOCK_SLOT_3,      /**< Directs the request to the
                            SIM/USIM/RUIM/CSIM inserted in Slot 3. */
  SIMLOCK_SLOT_4,      /**< Directs the request to the
                            SIM/USIM/RUIM/CSIM inserted in Slot 4. */
  SIMLOCK_SLOT_NUM
} simlock_slot_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_APP_SERVICE_STATUS_ENUM_TYPE

   DESCRIPTION:
     Identifies the current network service status on the application
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SRV_STATUS_NONE,
  SIMLOCK_SRV_STATUS_EXPIRED,
  SIMLOCK_SRV_STATUS_FULL
} simlock_app_service_status_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_TEMPORARY_UNLOCK_REQUEST_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the type of temporary unlock request
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_TEMPORARY_UNLOCK_SET,
  SIMLOCK_TEMPORARY_UNLOCK_UNSET
} simlock_temporary_unlock_request_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_DEVICE_MODE_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the type of device mode
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_DEVICE_NORMAL_OPERATION_MODE = 0,
  SIMLOCK_DEVICE_EMERGENCY_ONLY_MODE
} simlock_device_mode_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SUBSCRIPTION_INVALID_REASON_TYPE

   DESCRIPTION:
     This enum specifies the reason why the subscription is not valid
-------------------------------------------------------------------------------*/
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

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_EVENT_ENUM_TYPE

   DESCRIPTION: The events from the SIMLock
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_UNLOCK_EVENT,
  SIMLOCK_TEMPORARY_UNLOCK_EVENT,
  SIMLOCK_DEVICE_MODE_EVENT,
  SIMLOCK_REGISTER_REMOTE_SFS_EVENT,
  SIMLOCK_LOCK_EVENT,
  SIMLOCK_DELAY_TIMER_EVENT
} simlock_event_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_REGISTRATION_ENUM_TYPE

   DESCRIPTION: This enum specifies registration request type
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_REGISTER,
  SIMLOCK_DEREGISTER
} simlock_registration_enum_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_RSU_MESSAGE_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the message types in RSU
-------------------------------------------------------------------------------*/
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

/*=============================================================================

                       ABSTRACT DATA TYPE DECLARATIONS

=============================================================================*/
/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_mcc_type

   DESCRIPTION:
     This structure contains the MCC data in ASCII
------------------------------------------------------------------------------*/
typedef char   simlock_mcc_type[SIMLOCK_MCC_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_salt_type

   DESCRIPTION:
     This structure contains the SALT data in binary
------------------------------------------------------------------------------*/
typedef uint8  simlock_salt_type[SIMLOCK_SALT_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_hck_type

   DESCRIPTION:
     This structure contains the Hashed Control Key in binary
------------------------------------------------------------------------------*/
typedef uint8  simlock_hck_type[SIMLOCK_HCK_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_rsu_device_key_type

   DESCRIPTION:
     This structure contains the symmetric device Key in binary
------------------------------------------------------------------------------*/
typedef uint8  simlock_rsu_device_key_type[SIMLOCK_RSU_DEVICE_KEY_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_irm_type

   DESCRIPTION:
     This structure contains the IRM code in ASCII
------------------------------------------------------------------------------*/
typedef char  simlock_irm_type[SIMLOCK_IRM_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_modulus_type

   DESCRIPTION:
     This structure contains modulus part of RSA public key
------------------------------------------------------------------------------*/
typedef uint8 simlock_modulus_type[SIMLOCK_PUBKEY_MODULUS_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_exponent_type

   DESCRIPTION:
     This structure contains exponent part of RSA public key
------------------------------------------------------------------------------*/
typedef uint8 simlock_exponent_type[SIMLOCK_PUBKEY_EXPONENT_LEN];

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_REMOTE_LOCK_PUBLIC_KEY_TYPE

   DESCRIPTION:
     This structure contains modulus and exponent of RSA public key
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_modulus_type  modulus;
  simlock_exponent_type exponent;
} simlock_remote_lock_public_key_type;

/* ----------------------------------------------------------------------------
   DATA TYPE:      simlock_time_minutes_type
------------------------------------------------------------------------------*/
typedef uint32 simlock_time_minutes_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_mnc_type

   DESCRIPTION:
     This structure contains the MNC data in ASCII
------------------------------------------------------------------------------*/
typedef struct {
  uint8    mnc_len;
  char     mnc_data[SIMLOCK_MNC_MAX];
}simlock_mnc_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      simlock_msin_type

   DESCRIPTION:
     This structure contains the MSIN data in ASCII
------------------------------------------------------------------------------*/
typedef struct {
  uint8   msin_len;
  char    msin_data[SIMLOCK_MSIN_MAX];
}simlock_msin_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CK_DATA_TYPE

   DESCRIPTION:
     This structure contains the control key data in ASCII
------------------------------------------------------------------------------*/
typedef struct {
  uint8 simlock_ck_length;
  char  simlock_ck_data[SIMLOCK_CK_MAX];
} simlock_ck_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_DATA_TYPE

   DESCRIPTION:
     This structure is for generic data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint32   data_len;
  uint8  * data_ptr;
} simlock_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_IMSI_TYPE

   DESCRIPTION:
     This structure is for IMSI data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint8    imsi_len;
  uint8    imsi[SIMLOCK_IMSI_FILE_LEN];
} simlock_imsi_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_AD_TYPE

   DESCRIPTION:
     This structure is for AD data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint8    ad_len;
  uint8    ad[SIMLOCK_AD_FILE_LEN];
} simlock_ad_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_GID_TYPE

   DESCRIPTION:
     This structure is for GID data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint8    gid_len;
  uint8    gid_data[SIMLOCK_MAX_GID_LEN];
} simlock_gid_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SPN_TYPE

   DESCRIPTION:
     This structure is for SPN data in SIMLock
------------------------------------------------------------------------------*/
 typedef struct {
  boolean  spn_valid;
  uint8    spn_data[SIMLOCK_SPN_LEN];
} simlock_spn_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_EHPLMN_TYPE

   DESCRIPTION:
     This structure is for EHPLMN data in SIMLock
------------------------------------------------------------------------------*/
 typedef struct {
  uint8    ehplmn_len;
  uint8    ehplmn_data[SIMLOCK_EHPLMN_NUM_MAX * SIMLOCK_PLMN_ID_LEN];
} simlock_ehplmn_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ICCID_TYPE

   DESCRIPTION:
     This structure is for ICCID data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint8   iccid_len;
  char    iccid_data[SIMLOCK_ICCID_DIGITS_MAX];
} simlock_iccid_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_IMPI_TYPE

   DESCRIPTION:
     This structure is for IMPI data in SIMLock
------------------------------------------------------------------------------*/
typedef struct {
  uint8   impi_len;
  char    impi_data[SIMLOCK_IMPI_MAX];
} simlock_impi_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ICCID_FILE_TYPE

   DESCRIPTION:
     This structure is for EF-ICCID data provided by MMGSDI
------------------------------------------------------------------------------*/
typedef struct {
  uint8   iccid_len;
  uint8   iccid_data[SIMLOCK_ICCID_LEN];
} simlock_iccid_file_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_IMPI_FILE_TYPE

   DESCRIPTION:
     This structure is for EF-IMPI data provided by MMGSDI
------------------------------------------------------------------------------*/
typedef struct {
  uint8   impi_len;
  uint8   impi_data[SIMLOCK_IMPI_MAX];
} simlock_impi_file_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NW_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of MCC and MNC in ASCII.
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_mcc_type     mcc;
  simlock_mnc_type     mnc;
} simlock_nw_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NS_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of network subset code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  char                        imsi_digit6;
  char                        imsi_digit7;
} simlock_ns_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SP_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of service provider code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  simlock_gid_type            gid1;
} simlock_sp_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CP_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of corporate provider code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  simlock_gid_type            gid1;
  simlock_gid_type            gid2;
} simlock_cp_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SIM_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of sim code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type  nw_code;
  simlock_msin_type          imsi_msin;
} simlock_sim_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NW_TYPE2_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of irm code data in ASCII
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_irm_type           irm;
} simlock_nw_type2_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SPN_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of service provider name code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  simlock_spn_type            spn;
} simlock_spn_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SP_EHPLMN_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of SP + EHPLMN code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  simlock_gid_type            gid1;
  simlock_nw_code_data_type   ehplmn_nw_code;
} simlock_sp_ehplmn_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ICCID_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of ICCID code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_nw_code_data_type   nw_code;
  simlock_iccid_type          iccid;
} simlock_iccid_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_IMPI_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of IMPI code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_impi_type          impi;
} simlock_impi_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NS_SP_CODE_DATA_TYPE

   DESCRIPTION:
     This structure consists of NS + SP code data
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_ns_code_data_type   ns_code;
  simlock_gid_type            gid1;
} simlock_ns_sp_code_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NW_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of MCCs and MNCs
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       num_nw_codes;
  simlock_nw_code_data_type   nw_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_nw_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NS_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of network subset codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       num_ns_codes;
  simlock_ns_code_data_type   ns_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_ns_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SP_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of service provider codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       num_sp_codes;
  simlock_sp_code_data_type   sp_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_sp_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CP_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of corporate provider codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       num_cp_codes;
  simlock_cp_code_data_type   cp_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_cp_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SIM_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of sim codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                        num_sim_codes;
  simlock_sim_code_data_type   sim_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_sim_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NW_TYPE2_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of network type2 codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                             num_nw_type2_codes;
  simlock_nw_type2_code_data_type   nw_type2_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_nw_type2_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SPN_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of SPN codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       num_spn_codes;
  simlock_spn_code_data_type  spn_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_spn_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SP_EHPLMN_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of SP + EHPLMN codes
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                             num_sp_ehplmn_codes;
  simlock_sp_ehplmn_code_data_type  sp_ehplmn_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_sp_ehplmn_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ICCID_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of ICCID codes
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                             num_iccid_codes;
  simlock_iccid_code_data_type      iccid_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_iccid_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_IMPI_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of IMPI codes
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                             num_impi_codes;
  simlock_impi_code_data_type       impi_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_impi_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_NS_SP_CODE_LIST_TYPE

   DESCRIPTION:
     This structure consists of list of NS + SP codes.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                          num_ns_sp_codes;
  simlock_ns_sp_code_data_type   ns_sp_code_data[SIMLOCK_NUM_CODES_MAX];
} simlock_ns_sp_code_list_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CATEGORY_DATA_TYPE

   DESCRIPTION:
     This structure consists of SIMLock code data for a particular category
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_category_enum_type  category_type;
  union {
    /* 3GPP */
    simlock_nw_code_list_type        nw_3gpp_code_list;
    simlock_ns_code_list_type        ns_3gpp_code_list;
    simlock_sp_code_list_type        sp_3gpp_code_list;
    simlock_cp_code_list_type        cp_3gpp_code_list;
    simlock_spn_code_list_type       spn_3gpp_code_list;
    simlock_sp_ehplmn_code_list_type sp_ehplmn_3gpp_code_list;
    simlock_iccid_code_list_type     iccid_3gpp_code_list;
    simlock_impi_code_list_type      impi_3gpp_code_list;
    simlock_ns_sp_code_list_type     ns_sp_3gpp_code_list;
    simlock_sim_code_list_type       sim_3gpp_code_list;

    /* 3GPP2 */
    simlock_nw_code_list_type        nw_type1_3gpp2_code_list;
    simlock_nw_type2_code_list_type  nw_type2_3gpp2_code_list;
    simlock_sim_code_list_type       ruim_3gpp2_code_list;
  } code_data;
} simlock_category_data_type;

/* --------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_DISABLED_SLOT_DATA_TYPE

   DESCRIPTION:
     This structure contains disabled slot data
-------------------------------------------------------------------------- */
typedef struct{
  boolean slot[SIMLOCK_SLOT_COUNT_MAX];
} simlock_disabled_slot_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_CONFIG_POLICY_MSG_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for setting the
     configuration policy and disabled slot info
------------------------------------------------------------------------------*/
typedef struct {
  simlock_set_operation_enum_type            set_operation;
  simlock_slot_policy_enum_type              slot_policy;
  simlock_subscription_policy_enum_type      sub_policy;
  simlock_disabled_slot_data_type            disabled_slots;
} simlock_set_config_policy_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_RSU_MODE_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for setting the
     rsu mode
------------------------------------------------------------------------------*/
typedef struct {
  simlock_rsu_mode_enum_type      rsu_mode;
} simlock_set_rsu_mode_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_RSU_DEVICE_KEY_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for configuring the
     device key
------------------------------------------------------------------------------*/
typedef struct {
  simlock_rsu_device_key_type      rsu_device_key;
} simlock_set_rsu_device_key_msg_req_type;

/* ----------------------------------------------------------------------------
   ENUM:      SIMLOCK_SFS_ENUM_TYPE

   DESCRIPTION:
     This enum specifies the sfs location being used to store the data
-------------------------------------------------------------------------------*/
typedef enum {
  SIMLOCK_SFS_LOCAL  = 0,
  SIMLOCK_SFS_REMOTE
} simlock_sfs_enum_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_LOCK_HCK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for setting the
     lock by an operator
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_data_type   category;
  boolean                      auto_lock;
  boolean                      blacklist;
  uint32                       num_retries_max;
  uint32                       iteration_cnt;
  simlock_salt_type            salt;
  simlock_hck_type             hck;
  boolean                      reuse_previous_code_list;
  simlock_sfs_enum_type        sfs_type;
} simlock_set_lock_hck_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_LOCK_CK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for setting the
     lock by an oem
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_data_type   category;
  boolean                      auto_lock;
  boolean                      blacklist;
  uint32                       num_retries_max;
  uint32                       iteration_cnt;
  simlock_ck_data_type         ck;
  boolean                      reuse_previous_code_list;
  simlock_sfs_enum_type        sfs_type;
} simlock_set_lock_ck_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CHANGE_CK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for changing CK by
     an oem
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_enum_type   category_type;
  simlock_ck_data_type         old_ck;
  simlock_ck_data_type         new_ck;
} simlock_change_ck_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SUBSCRIPTION_DATA_TYPE

   DESCRIPTION:
     This structure consists of data from the card needed by SIMLock to verify
     the card validity
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_subscription_enum_type         sub_type;
  simlock_imsi_type                      imsi;
  simlock_ad_type                        ad;
  simlock_gid_type                       gid1;
  simlock_gid_type                       gid2;
  simlock_spn_type                       spn;
  simlock_ehplmn_type                    ehplmn;
  simlock_iccid_file_type                iccid;
  simlock_impi_file_type                 impi;
  simlock_app_service_status_enum_type   service_status;
} simlock_subscription_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CARD_DATA_TYPE

   DESCRIPTION:
     This structure is for the subscriptions available on a card
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                            num_subscriptions;
  boolean                          is_card_present;
  boolean                          is_gw_app_available;
  boolean                          is_1x_app_available;
  simlock_subscription_data_type   subscription_data[SIMLOCK_SUBS_COUNT_MAX];
} simlock_card_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RUN_ALGORITHM_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for running the
     algorithm. NOTE: The reason there is no number of cards is because we have to
     identify the slot on which the card is present. Check number of
     subscription on card to identify the present card.
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_card_data_type  card_data[SIMLOCK_SLOT_COUNT_MAX];
} simlock_run_algorithm_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_UNLOCK_DEVICE_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for unlocking the
     device. If the device is locked from RSU then unlock does not require CK
     as the blob is signed. In this case, CK is ignored and flag ignore_ck is
     set to TRUE.
     The flag probe_ck is set to TRUE to check whether configured CK is correct.
     In this case, the command does not unlock the category.
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_enum_type   category;
  simlock_ck_data_type         ck;
  boolean                      ignore_ck;
  boolean                      probe_ck;
}simlock_unlock_device_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_GET_CATEGORY_DATA_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message for retrieve the
     category data for a specific simlock feature.
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_enum_type   category;
} simlock_get_category_data_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_TEMPORARY_UNLOCK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message to set or unset the
     temporary unlock. The member duration represents the number of minutes
     to temporarily unlock a category
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_temporary_unlock_request_enum_type  temporary_unlock_type;
  simlock_slot_enum_type                      slot;
  simlock_category_enum_type                  category;
  simlock_time_minutes_type                   duration;
}simlock_temporary_unlock_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SET_DEVICE_MODE_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for the SIMLock request message to set the device in
     emergency only mode or normal operation mode
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_device_mode_enum_type   mode;
} simlock_set_device_mode_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ADD_LOCK_CODES_CK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for adding the codes for a category using the ck
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type            slot;
  simlock_ck_data_type              ck;
  boolean                           blacklist;
  simlock_category_data_type        category;
}simlock_add_lock_codes_ck_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ADD_LOCK_CODES_HCK_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is for adding the codes for a category using the hck
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type            slot;
  simlock_hck_type                  hck;
  boolean                           blacklist;
  simlock_category_data_type        category;
}simlock_add_lock_codes_hck_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RELOCK_DEVICE_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is used in relock request message for reactivating SIMLock
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  simlock_category_enum_type   category_type;
  simlock_ck_data_type         ck;
  simlock_sfs_enum_type        sfs_type;
} simlock_relock_device_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CHANGE_LIST_TYPE_MSG_REQ_TYPE

   DESCRIPTION:
     This structure is used for switching the configuration of lock codes
-------------------------------------------------------------------------------*/
typedef struct{
  simlock_slot_enum_type       slot;
  boolean                      blacklist;
} simlock_change_list_type_msg_req_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_MESSAGE_REQUEST_DATA_TYPE

   DESCRIPTION:
     This structure is for the various request messages in SIMLock
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_message_enum_type                   msg_type;
  union {
    simlock_set_config_policy_msg_req_type    config_policy_msg;
    simlock_set_lock_hck_msg_req_type         lock_hck_msg;
    simlock_set_lock_ck_msg_req_type          lock_ck_msg;
    simlock_run_algorithm_msg_req_type        algorithm_msg;
    simlock_unlock_device_msg_req_type        unlock_msg;
    simlock_get_category_data_msg_req_type    category_data_msg;
    simlock_temporary_unlock_msg_req_type     temporary_unlock_msg;
    simlock_set_device_mode_msg_req_type      device_mode_msg;
    simlock_add_lock_codes_hck_msg_req_type   add_lock_codes_hck_msg;
    simlock_add_lock_codes_ck_msg_req_type    add_lock_codes_ck_msg;
    simlock_relock_device_msg_req_type        relock_msg;
    simlock_set_rsu_mode_msg_req_type         rsu_mode_msg;
    simlock_change_ck_msg_req_type            change_ck_msg;
    simlock_change_list_type_msg_req_type     change_list_type_msg;
    simlock_set_rsu_device_key_msg_req_type   rsu_device_key_msg;
  } message;
} simlock_message_request_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_TEMP_UNLOCK_DURATION_REMAINING_TYPE

   DESCRIPTION:
     This structure is for the amount of time (in secs) remaining for the
     temporary unlock
-------------------------------------------------------------------------------*/
typedef struct {
  uint32    duration[SIMLOCK_SLOT_COUNT_MAX][SIMLOCK_CATEGORY_COUNT_MAX];
} simlock_temp_unlock_remaining_time_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_UNLOCK_DEVICE_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to an unlock
     request
-------------------------------------------------------------------------------*/
typedef struct {
  uint32    num_retries_max;
  uint32    curr_retries;
} simlock_unlock_device_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CATEGORY_INFO_TYPE

   DESCRIPTION:
     This structure is for category data and status
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_category_enum_type   category;
  boolean                      category_status;
  boolean                      blacklist;
  uint32                       num_retries_max;
  uint32                       curr_retries;
  boolean                      category_ok_to_reactivate;
  boolean                      ck_present;
} simlock_category_info_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_LOCK_INFO_TYPE

   DESCRIPTION:
     This structure is for lock info for the various categories
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_category_info_type  category_info[SIMLOCK_CATEGORY_COUNT_MAX];
} simlock_lock_info_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_GET_STATUS_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to the status
     request message
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_slot_policy_enum_type            slot_policy;
  simlock_subscription_policy_enum_type    subscription_policy;
  simlock_lock_info_type                   lock_info[SIMLOCK_SLOT_COUNT_MAX];
  simlock_temp_unlock_remaining_time_type  remaining_time;
  boolean                                  remote_simlock_storage;
  boolean                                  emergency_only_mode;
  simlock_disabled_slot_data_type          disabled_slots;
} simlock_get_status_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_SUBSCRIPTION_VALIDITY_INFO_TYPE

   DESCRIPTION:
     This structure is for validity status for a subscription. In case a
     particular subscription is not valid, the category that failed the check,
     maximum number of unlock attempts and current number of unlock attempts
     are populated in failed_category, num_retries_max and curr_retries
     respectively. The reason for invalidity of a subscription is provided
     in the failure_reason.
-------------------------------------------------------------------------------*/
typedef struct {
  boolean                                   is_subscription_valid;
  simlock_category_enum_type                failed_category;
  uint32                                    num_retries_max;
  uint32                                    curr_retries;
  simlock_subscription_invalid_reason_type  failure_reason;
} simlock_subscription_validity_info_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CARD_STATUS_DATA_TYPE

   DESCRIPTION:
     This structure is for subscription status on all slots for various
     subscriptions
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                                     num_subscriptions;
  simlock_subscription_validity_info_type   subscription_data[SIMLOCK_SUBS_COUNT_MAX];
} simlock_card_validity_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RUN_ALGORITHM_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to the run
     algorithm request message
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_card_validity_data_type   card_validity_data[SIMLOCK_SLOT_COUNT_MAX];
} simlock_run_algorithm_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CATEGORY_DATA_BLACKLIST_TYPE

   DESCRIPTION:
     This structure is for SIMLock code data, which is categorized as blacklist.
     Each list contains the maximum of 20 codes. The num_of_lists indicate count
     of such lists.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                                     num_of_lists;
  simlock_category_data_type              * blacklist_data_ptr;
}simlock_category_data_blacklist_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CATEGORY_DATA_WHITELIST_TYPE

   DESCRIPTION:
     This structure is for SIMLock code data, which is categorized as whitelist.
     Each list contain the maximum of 20 codes. The num_of_lists indicate count
     of such lists.
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                                     num_of_lists;
  simlock_category_data_type              * whitelist_data_ptr;
}simlock_category_data_whitelist_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CATEGORY_DATA_MSG_RESP_TYPE

   DESCRIPTION:
     This structure consists of SIMLock code data for a particular category
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_category_data_whitelist_type        category_data_whitelist;
  simlock_category_data_blacklist_type        category_data_blacklist;
} simlock_get_category_data_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RELOCK_DEVICE_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to a relock
     request
-------------------------------------------------------------------------------*/
typedef struct {
  uint32    num_retries_max;
  uint32    curr_retries;
} simlock_relock_device_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_ADD_LOCK_DEVICE_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to a add lock
     request
-------------------------------------------------------------------------------*/
typedef struct {
  uint32    num_retries_max;
  uint32    curr_retries;
} simlock_add_lock_device_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_CHANGE_CK_MSG_RESP_TYPE

   DESCRIPTION:
     This structure is for the SIMLock response corresponding to change CK
     request
-------------------------------------------------------------------------------*/
typedef struct {
  uint32    num_retries_max;
  uint32    curr_retries;
} simlock_change_ck_msg_resp_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_MESSAGE_RESPONSE_DATA_TYPE

   DESCRIPTION:
     This structure is for the various response messages in SIMLock
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_message_enum_type  msg_type;
  union {
    simlock_get_status_msg_resp_type           get_status_resp;
    simlock_run_algorithm_msg_resp_type        run_algo_resp;
    simlock_unlock_device_msg_resp_type        unlock_resp;
    simlock_get_category_data_msg_resp_type    get_category_data_resp;
    simlock_relock_device_msg_resp_type        relock_resp;
    simlock_add_lock_device_msg_resp_type      add_lock_resp;
    simlock_change_ck_msg_resp_type            change_ck_resp;
  } message;
} simlock_message_response_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_UNLOCK_EVENT_TYPE

   DESCRIPTION:
     This structure contains the unlock information from the unlock event
-------------------------------------------------------------------------------*/
typedef struct {
  uint32                             num_retries_max;
  uint32                             curr_retries;
  simlock_slot_enum_type             slot;
  simlock_category_enum_type         category;
} simlock_unlock_event_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_GENERIC_EVENT_TYPE

   DESCRIPTION:
     This structure contains the slot and category information from
     an event (e.g. temporary unlock event or lock event)
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_slot_enum_type             slot;
  simlock_category_enum_type         category;
} simlock_generic_event_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_LOCK_EVENT_TYPE

   DESCRIPTION:
     This structure contains the lock information from the lock event
-------------------------------------------------------------------------------*/
typedef struct {
  uint32                             num_retries_max;
  uint32                             curr_retries;
  simlock_slot_enum_type             slot;
  simlock_category_enum_type         category;
} simlock_lock_event_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_DEVICE_MODE_EVENT_TYPE

   DESCRIPTION:
     This structure contains the device mode information from
     the device mode event
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_device_mode_enum_type     mode;
} simlock_device_mode_event_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_EVENT_DATA_TYPE

   DESCRIPTION:
     This structure is for the various event messages from SIM Lock
-------------------------------------------------------------------------------*/
typedef struct {
  /* The triggered event */
  simlock_event_enum_type                   evt_type;
  union{
    simlock_unlock_event_type               unlock;
    simlock_generic_event_type              temporary_unlock;
    simlock_device_mode_event_type          device_mode;
    simlock_lock_event_type                 lock;
  } message;
} simlock_event_data_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RSU_VERSION_TYPE

   DESCRIPTION:
     This structure contains the major and minor version of request blob 
     supported by RSU
-------------------------------------------------------------------------------*/
typedef struct {
  uint8                       major;
  uint8                       minor;
} simlock_rsu_version_type;

/* ----------------------------------------------------------------------------
   STRUCTURE:      SIMLOCK_RSU_MESSAGE_RESPONSE_DATA_TYPE

   DESCRIPTION:
     This structure is for the various response messages in SIMLock RSU
-------------------------------------------------------------------------------*/
typedef struct {
  simlock_rsu_message_enum_type              msg_type;
  union {
    simlock_data_type                        set_config_resp_data;
    simlock_data_type                        generate_hash_resp_data;
    simlock_data_type                        get_key_resp_data;
    simlock_rsu_version_type                 version;
    simlock_data_type                        generate_simlock_blob_resp_data;
    uint16                                   delay_timer_value;
  } message;
} simlock_rsu_message_response_data_type;

#endif /* SIMLOCK_COMMON_H */
