/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ls.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/12 22:29:36 by csummers          #+#    #+#             */
/*   Updated: 2016/12/12 22:29:37 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_LS_H
# define FT_LS_H

# define MAX_FNAME_LEN 256
# define SIX_MONTHS_AGO 15552000
# define NO_PATH(x) (x == '.' || x == '/' || x == '~')
# define MAJOR(x) ((x >> 24) & 0xff)
# define MINOR(x) (x & 0xff)

# include "libft.h"
# include <dirent.h>
# include <sys/stat.h>
# include <pwd.h>
# include <grp.h>
# include <sys/xattr.h>
# include <time.h>
# include <stdio.h>
# include <sys/errno.h>

typedef struct	s_ls
{
	_Bool		l;
	_Bool		cap_r;
	_Bool		a;
	_Bool		r;
	_Bool		t;
	_Bool		u;
	_Bool		c;
	_Bool		f;
	_Bool		one;
}				t_ls;

typedef struct	s_dir
{
	char		*path;
	DIR			*ptr;
}				t_dir;

typedef struct	s_lflag
{
	size_t		link_width;
	size_t		name_width;
	size_t		group_width;
	size_t		size_width;
	size_t		major_width;
	size_t		minor_width;
}				t_lflag;

t_ls			*ls_initialize(void);
void			ls_die(char *s);
char			**ls_organize_argv(t_ls *ls_f, int argc, char **argv);
void			ls_sort_files(char **files, t_ls *ls_f, _Bool one);
void			ls_handle_argv(char **files_and_dirs, t_ls *ls_f);
void			ls_print_files(char **files, t_ls *ls_f, _Bool one);
void			ls_manipulate_dir(DIR *dir_ptr, t_ls *ls_f, char *dir_name);
char			*ls_add_slash(char *dir_name);
char			*ls_get_after_slash(char *path);
long			ls_str_cmp(const char *s1, const char *s2, t_ls *ls_f);
long			ls_time_cmp(const char *f1, const char *f2, t_ls *ls_f);
long			ls_time_cmp_l(const char *f1, const char *f2, t_ls *ls_f);
t_lflag			*ls_configure_lprint(char **files, t_ls *ls_f, _Bool one);
t_lflag			*ls_initialize_lflag(void);
size_t			ls_get_digits(size_t n);
void			ls_lprint(char *path, char *name, t_ls *ls_f, t_lflag *lflag);
int				ls_print_file_type(mode_t m);
void			ls_print_permissions(mode_t m);
void			ls_print_timing(struct stat *stats, t_ls *ls_f);
t_dir			**ls_find_dirs(char **files, t_ls *ls_f);
void			ls_delete_dirs(t_dir ***dirs);
void			ls_strarrdel(char ***arr);

#endif
