open Ctypes

type t = Pkcs11_CK_ULONG.t
[@@deriving ord]

let (!) x  = Unsigned.ULong.of_string (Int64.to_string x)
let _CKG_MGF1_SHA1: t   = ! 0x00000001L
let _CKG_MGF1_SHA256: t = ! 0x00000002L
let _CKG_MGF1_SHA384: t = ! 0x00000003L
let _CKG_MGF1_SHA512: t = ! 0x00000004L
let _CKG_MGF1_SHA224: t = ! 0x00000005L

let (==) a b = Unsigned.ULong.compare a b = 0
let to_string ul =
  if ul == _CKG_MGF1_SHA1 then "CKG_MGF1_SHA1"
  else if ul == _CKG_MGF1_SHA256 then "CKG_MGF1_SHA256"
  else if ul == _CKG_MGF1_SHA384 then "CKG_MGF1_SHA384"
  else if ul == _CKG_MGF1_SHA512 then "CKG_MGF1_SHA512"
  else if ul == _CKG_MGF1_SHA224 then "CKG_MGF1_SHA224"
  else Unsigned.ULong.to_string ul

let of_string = function
  | "CKG_MGF1_SHA1" -> _CKG_MGF1_SHA1
  | "CKG_MGF1_SHA256" -> _CKG_MGF1_SHA256
  | "CKG_MGF1_SHA384" -> _CKG_MGF1_SHA384
  | "CKG_MGF1_SHA512" -> _CKG_MGF1_SHA512
  | "CKG_MGF1_SHA224" -> _CKG_MGF1_SHA224
  | s ->
      begin
        try
          Unsigned.ULong.of_string s
        with
          | Sys.Break as e -> raise e
          | _ -> invalid_arg "CK_RSA_PKCS_MGF_TYPE.of_string"
      end

let typ : t typ = ulong
