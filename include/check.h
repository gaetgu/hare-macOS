#ifndef HARE_CHECK_H
#define HARE_CHECK_H
#include <stdbool.h>
#include "identifier.h"
#include "scope.h"
#include "types.h"
#include "type_store.h"

struct expression;

#define MODCACHE_BUCKETS 256

struct modcache {
	struct identifier ident;
	struct scope *scope;
	struct modcache *next;
};

struct ast_expression;
struct ast_unit;

struct define {
	struct identifier ident;
	struct ast_type *type;
	struct ast_expression *initializer;
	struct define *next;
};

struct errors {
	struct location loc;
	char *msg;
	struct errors *next;
};

struct context {
	struct modcache **modcache;
	struct define *defines;
	struct type_store *store;
	const struct type *fntype;
	struct identifier *ns;
	bool is_test;
	struct scope *unit;
	struct scope *scope;
	struct scope *resolving_enum;
	bool deferring;
	int id;
	struct errors *errors;
	struct errors **next;
};

struct constant_decl {
	const struct type *type;
	const struct expression *value;
};

enum func_decl_flags {
	FN_FINI = 1 << 0,
	FN_INIT = 1 << 1,
	FN_TEST = 1 << 2,
};

struct function_decl {
	const struct type *type;
	struct expression *body;
	struct scope *scope;
	unsigned int flags; // enum function_flags
};

struct global_decl {
	const struct type *type;
	struct expression *value; // EXPR_CONSTANT
};

enum declaration_type {
	DECL_CONST,
	DECL_FUNC,
	DECL_GLOBAL,
	DECL_TYPE,
};

struct declaration {
	enum declaration_type type;
	struct identifier ident;
	char *symbol;
	bool exported;
	union {
		struct constant_decl constant;
		struct function_decl func;
		struct global_decl global;
		const struct type *_type;
	};
};

struct declarations {
	struct declaration *decl;
	struct declarations *next;
};

struct unit {
	struct identifier *ns;
	struct declarations *declarations;
	struct identifiers *imports;
};

enum idecl_type {
	IDECL_DECL,
	IDECL_ENUM_TYPE,
	IDECL_ENUM_FLD,
};

// Keeps track of enum specific context required for enum field resolution
struct incomplete_enum_field {
	struct ast_enum_field *field;
	struct ast_type *type;
	struct scope *enum_scope;
};

// Keeps track of context required to resolve a declaration or an enum field
// Extends the scope_object struct so it can be inserted into a scope
struct incomplete_declaration {
	const struct scope_object obj;
	struct scope *imports; // the scope of this declaration's subunit
	enum idecl_type type;
	bool in_progress;
	union {
		struct {
			struct ast_decl decl;
			struct scope *enum_values;
			struct identifiers *enum_aliases;
		};
		struct incomplete_enum_field *field;
	};
};

void mkident(struct context *ctx, struct identifier *out,
		const struct identifier *in);

const struct scope_object *scan_decl_finish(struct context *ctx,
	const struct scope_object *obj, struct dimensions *dim);

struct scope *check(struct type_store *ts,
	bool is_test,
	struct define *defines,
	const struct ast_unit *aunit,
	struct unit *unit);

struct scope *check_internal(struct type_store *ts,
	struct modcache **cache,
	bool is_test,
	struct define *defines,
	const struct ast_unit *aunit,
	struct unit *unit,
	bool scan_only);

void check_expression(struct context *ctx,
	const struct ast_expression *aexpr,
	struct expression *expr,
	const struct type *hint);

#endif
