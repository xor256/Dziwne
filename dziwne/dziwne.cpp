#include <ruby.h>
#include <stdio.h>

typedef VALUE (ruby_method)(...);

struct moje
{
 char x;
};

void t_free(struct moje *m)
{
 free(m);
}

static VALUE t_allocate(VALUE obj)
{
struct moje *m = (struct moje*)malloc(sizeof(struct moje));
 if( m == NULL )
   rb_raise(rb_eNoMemError, "Brakuje pamięci (%ld bajty)", sizeof(struct moje));

 m->x = 42;

return Data_Wrap_Struct(obj,NULL,t_free,m);
}

extern "C" VALUE t_cosik()
{
 VALUE str = rb_str_new2( "Dziwne" );

return str;
}



VALUE cDziwne;

extern "C" void Init_Dziwne()
{
 cDziwne = rb_define_class("Dziwne", rb_cObject);
 rb_define_alloc_func(cDziwne,t_allocate);
 rb_define_method(cDziwne, "cosik", (ruby_method*) &t_cosik, 0);
}
